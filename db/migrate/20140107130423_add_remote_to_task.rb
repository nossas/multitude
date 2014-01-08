class AddRemoteToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :remote, :boolean, null: false, default: false
  end
end
