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

  def pending?
    status == :pending
  end

  def accepted?
    status == :accepted
  end

  def rejected?
    status == :rejected
  end

  def deliver! options
    self.update_attributes delivered_at: Time.now, file: options[:file], text: options[:text]
    DeliveryMailer.delay.new_delivery(self)
  end

  def accept!
    self.update_attribute :accepted_at, Time.now
    DeliveryMailer.delay.accepted(self)
  end

  def reject!
    self.update_attribute :rejected_at, Time.now
    DeliveryMailer.delay.rejected(self)
  end
end
