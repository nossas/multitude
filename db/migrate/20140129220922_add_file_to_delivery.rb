class AddFileToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :file, :string
  end
end
