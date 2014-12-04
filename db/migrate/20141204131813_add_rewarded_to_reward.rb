class AddRewardedToReward < ActiveRecord::Migration
  def change
    add_column :rewards, :rewarded, :boolean, defaut: false
  end
end
