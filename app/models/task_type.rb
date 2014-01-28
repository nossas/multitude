class TaskType < ActiveRecord::Base
  has_many :tasks
  belongs_to :category
end
