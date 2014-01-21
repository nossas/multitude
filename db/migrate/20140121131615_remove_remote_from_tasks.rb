class RemoveRemoteFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :remote, :boolean, null: false, default: false
  end
end
