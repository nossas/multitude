class AddMinCapacityToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :min_capacity, :integer, null: false, default: 1
  end
end
