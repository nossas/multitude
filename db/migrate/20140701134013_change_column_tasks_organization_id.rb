class ChangeColumnTasksOrganizationId < ActiveRecord::Migration
  def up
    change_column :tasks, :organization_id, :integer, null: false
  end

  def down
    change_column :tasks, :organization_id, :integer
  end
end
