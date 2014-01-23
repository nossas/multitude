class RemoveMinCapacityFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :min_capacity, :integer, default: 1, null: false
  end
end
