class RemoveMaterialFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :material, :text
  end
end
