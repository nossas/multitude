class AddFieldsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :integer
    add_column :memberships, :organization_id, :integer
    add_timestamps :memberships
  end
end
