class Delivery < ActiveRecord::Base
  validates :task_id, :user_id, presence: true

  belongs_to :user
  belongs_to :task

  mount_uploader :file, DeliveryUploader

  def status
    if self.accepted_at
      :accepted
    elsif self.rejected_at
      :rejected
    else
      :pending
    end
  end

  def deliver
    self.delivered_at = Time.now
    DeliveryMailer.new_delivery(self).deliver
  end

  def accept
    self.accepted_at = Time.now
    DeliveryMailer.delivery_accepted(self).deliver
  end

  def reject
    self.rejected_at = Time.now
    DeliveryMailer.delivery_rejected(self).deliver
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
end
