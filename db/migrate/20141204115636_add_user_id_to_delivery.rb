class AddUserIdToDelivery < ActiveRecord::Migration
  def up
    add_column :deliveries, :user_id, :integer

    Delivery.all.each do |delivery|
      task_subscription = TaskSubscription.find(delivery.task_subscription_id)
      delivery.update_attribute :user_id, task_subscription.user_id
    end
  end

  def down
    remove_column :deliveries, :user_id
  end
end
