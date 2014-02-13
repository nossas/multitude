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
  end

  def reject!
    self.update_attribute :rejected_at, Time.now
  end
end
