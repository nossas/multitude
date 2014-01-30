class AddDeliveredAtToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :delivered_at, :datetime
  end
end
