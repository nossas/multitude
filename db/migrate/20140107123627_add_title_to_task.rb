class AddTitleToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string, null: false
  end
end
