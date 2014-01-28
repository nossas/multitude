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

  def type
    self.task_type.try(:name)
  end

  def formatted_deadline
    self.deadline.strftime('Dia %d.%m.%Y, às %H:%M') if self.deadline
  end

  def expired?
    self.deadline > Time.now
  end
end
