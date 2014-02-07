class AddDeliveredExpiringAlertToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :delivered_expiring_alert, :boolean, default: false
  end
end
