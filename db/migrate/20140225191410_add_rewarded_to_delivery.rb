class AddRewardedToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :rewarded, :boolean, defaut: false
  end
end
