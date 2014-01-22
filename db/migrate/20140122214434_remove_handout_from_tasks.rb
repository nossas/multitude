class RemoveHandoutFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :handout, :text
  end
end
