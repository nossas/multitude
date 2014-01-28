class Delivery < ActiveRecord::Base
  validates :task_id, :user_id, presence: true

  belongs_to :user
  belongs_to :task
end
