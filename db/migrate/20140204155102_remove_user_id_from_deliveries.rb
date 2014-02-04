class RemoveUserIdFromDeliveries < ActiveRecord::Migration
  def change
    remove_column :deliveries, :user_id, :integer
  end
end
