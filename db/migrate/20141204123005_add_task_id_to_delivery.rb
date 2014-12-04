class AddTaskIdToDelivery < ActiveRecord::Migration
  def up
    add_column :deliveries, :task_id, :integer

    Delivery.all.each do |delivery|
      task_subscription = TaskSubscription.find(delivery.task_subscription_id)
      delivery.update_attribute :task_id, task_subscription.task_id
    end
  end

  def down
    remove_column :deliveries, :task_id
  end
end
