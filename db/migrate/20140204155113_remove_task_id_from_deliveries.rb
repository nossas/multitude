class RemoveTaskIdFromDeliveries < ActiveRecord::Migration
  def change
    remove_column :deliveries, :task_id, :integer
  end
end
