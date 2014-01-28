class AddCategoryIdToTaskType < ActiveRecord::Migration
  def change
    add_reference :task_types, :category, index: true
  end
end
