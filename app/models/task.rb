class Task < ActiveRecord::Base
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
end
