class Delivery < ActiveRecord::Base
  validates :task_id, :user_id, presence: true

  belongs_to :user
  belongs_to :task

  mount_uploader :file, DeliveryUploader

  after_save { DeliveryMailer.new_delivery(self).deliver if self.text.present? }
end
