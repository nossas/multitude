class AddTaskTypeIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_type_id, :integer, null: false
  end
end
