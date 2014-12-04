class Delivery < ActiveRecord::Base
  validates :user_id, :task_id, presence: true
  belongs_to :user
  belongs_to :task

  mount_uploader :file, DeliveryUploader

  after_create { MultitudeMailer.delay.new_delivery(self) }

  auto_html_for :text do
    link :target => "_blank", :rel => "nofollow"
  end


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
    self.update_attribute :accepted_at, Time.current
    MultitudeMailer.delay.your_delivery_was_accepted(self)
    self.delay.sync_reward
  end

  def reject!
    self.update_attribute :rejected_at, Time.current
  end

  def sync_reward
    url = "#{ENV["MEURIO_HOST"]}/rewards.json"
    reward = { task_type_id: self.task.task_type.id, user_id: self.user.id, points: task.points, source_app: "Multitude", source_model: "Delivery", source_id: self.id }
    body = { token: ENV["MEURIO_API_TOKEN"], reward: reward }
    response = HTTParty.post(url, body: body)
    self.update_attribute :rewarded, true if response.code == 201
  end
end
