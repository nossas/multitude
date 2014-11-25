class Task < ActiveRecord::Base
  validates :title, :points, :task_type_id, :description, :organization_id, presence: true
  validates :max_deliveries, :numericality => { :greater_than => 0 }, allow_nil: true

  has_many :deliveries, through: :task_subscriptions
  has_many :task_subscriptions
  belongs_to :task_type
  belongs_to :mobilization, primary_key: :hashtag, foreign_key: :hashtag
  belongs_to :user
  belongs_to :organization
  has_one :category, through: :task_type

  after_create :warn_matches

  scope :expiring,  -> { where("deadline <= ? AND deadline >= ?", Time.zone.now + 24.hours, Time.zone.now) }
  scope :expired,   -> { where("deadline < ?", Time.zone.now) }
  scope :available, -> { where("(SELECT count(*) FROM task_subscriptions WHERE task_subscriptions.task_id = tasks.id) < tasks.max_deliveries OR tasks.max_deliveries IS NULL") }

  auto_html_for :description do
    image
    youtube(:width => "100%", :height => 350)
    link :target => "_blank", :rel => "nofollow"
  end

  def warn_matches
    self.matches.each do |u|
      MultitudeMailer.delay.we_have_a_new_task_for_you(u, self)
    end

    MultitudeMailer.delay.no_match(self) if self.matches.empty?
  end

  def matches
    User.joins(:organizations)
      .where(organizations: { id: self.organization_id })
      .where("skills && ARRAY[?]::character varying[]", self.skills)
  end

  def formatted_deadline
    self.deadline.in_time_zone(Time.zone).strftime('Dia %d.%m.%Y, às %H:%M') if self.deadline
  end

  def expired?
    self.deadline < Time.current
  end

  def deliveries_missing
    missing = self.max_deliveries - self.task_subscriptions.count
    missing > 0 ? missing : 0
  end

  def full?
    self.max_deliveries.present? ? self.max_deliveries <= self.task_subscriptions.count : false
  end

  def subscribable?
    !self.expired? && !self.full?
  end
end
