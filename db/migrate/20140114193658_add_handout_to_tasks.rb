class AddHandoutToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :handout, :text
  end
end
