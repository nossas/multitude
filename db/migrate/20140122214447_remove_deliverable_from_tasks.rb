class RemoveDeliverableFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :deliverable, :text
  end
end
