class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  has_many :deliveries

  validates :user_id, :task_id, presence: true
  validates :task_id, uniqueness: { scope: :user_id }
end
