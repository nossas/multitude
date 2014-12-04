class RemoveRewardedFromDelivery < ActiveRecord::Migration
  def change
    remove_column :deliveries, :rewarded, :boolean, defaut: false
  end
end
