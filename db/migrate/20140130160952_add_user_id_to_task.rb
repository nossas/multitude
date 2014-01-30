class AddUserIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer, null: false
  end
end
