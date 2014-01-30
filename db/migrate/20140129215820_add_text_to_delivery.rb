class AddTextToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :text, :text
  end
end
