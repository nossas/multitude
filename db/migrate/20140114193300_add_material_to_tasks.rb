class AddMaterialToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :material, :text
  end
end
