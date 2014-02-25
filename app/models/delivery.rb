class Delivery < ActiveRecord::Base
  validates :task_subscription_id, presence: true
  belongs_to :task_subscription
  has_one :user, through: :task_subscription
  has_one :task, through: :task_subscription

  mount_uploader :file, DeliveryUploader

  after_create { MultitudeMailer.delay.new_delivery(self) }

  def status
    if self.accepted_at
      :accepted
    elsif self.rejected_at
      :rejected
    else
      :pending
    end
  end

  def pending?
    status == :pending
  end

  def accepted?
    status == :accepted
  end

  def rejected?
    status == :rejected
  end

  def accept!
    self.update_attribute :accepted_at, Time.now
    MultitudeMailer.delay.your_delivery_was_accepted(self)
    self.delay.sync_reward
  end

  def reject!
    self.update_attribute :rejected_at, Time.now
  end

  def sync_reward
    url = "#{ENV["MEURIO_HOST"]}/rewards.json"
    reward = { task_type_id: self.task.task_type.id, user_id: self.user.id, points: task.points, source_app: "Mutitude", source_model: "Delivery", source_id: self.id }
    body = { token: ENV["MEURIO_API_TOKEN"], reward: reward }
    response = HTTParty.post(url, body: body)
    self.update_attribute :rewarded, true if response.code == 201
  end
end
