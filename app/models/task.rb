class Task < ActiveRecord::Base
  validates :title, :points, :task_type_id, :description, presence: true
  validates :max_deliveries, :numericality => { :greater_than => 0 }, allow_nil: true

  has_many :deliveries
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  belongs_to :user

  after_create :warn_matches

  auto_html_for :description do
    html_escape
    image
    youtube(:width => "100%", :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

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

  def expired?
    self.deadline < Time.now
  end

  def deliveries_missing
    missing = self.max_deliveries - self.deliveries.where("delivered_at IS NULL OR accepted_at IS NOT NULL").count
    missing > 0 ? missing : 0
  end

  def full?
    self.max_deliveries.present? ? self.max_deliveries <= self.deliveries.select(:user_id).map{|x| x.user_id}.uniq.size : false
  end
end
