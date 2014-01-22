class Task < ActiveRecord::Base
  validates :points, :task_type_id, presence: true

  belongs_to :task_type
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
end
