class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  has_many :deliveries

  validates :user_id, :task_id, presence: true
  validates :task_id, uniqueness: { scope: :user_id }

  scope :undelivered, -> { joins('LEFT OUTER JOIN deliveries ON deliveries.task_subscription_id = task_subscriptions.id').where("deliveries.id IS NULL") }
end
