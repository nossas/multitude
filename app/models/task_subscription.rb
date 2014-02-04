class TaskSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user_id, :task_id, presence: true
  validates :task_id, uniqueness: { scope: :user_id }
end
