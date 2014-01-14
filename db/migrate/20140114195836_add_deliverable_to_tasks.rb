class AddDeliverableToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :deliverable, :text
  end
end
