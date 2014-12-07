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
    Reward.create(user_id: self.user_id, task_id: self.task_id)
  end

  def reject!
    self.update_attribute :rejected_at, Time.current
  end
end
