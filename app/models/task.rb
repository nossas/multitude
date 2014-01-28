class Task < ActiveRecord::Base
  validates :title, :points, :task_type_id, :description, presence: true
  validates :max_deliveries, :numericality => { :greater_than => 0 }, allow_nil: true

  belongs_to :task_type
  has_many :deliveries

  after_create :warn_matches

  def warn_matches
    self.matches.each do |u|
      TaskMailer.match(u, self).deliver
    end
  end

  def matches
    User.where("skills && ARRAY[?]::character varying[]", self.skills)
  end

  def category
    self.task_type.category.try(:name) if self.task_type
  end

  def formatted_deadline
    self.deadline.strftime('Dia %d.%m.%Y, às %H:%M') if self.deadline
  end
end
