class RemoveDeliveredAtFromDeliveries < ActiveRecord::Migration
  def change
    remove_column :deliveries, :delivered_at, :datetime
  end
end
