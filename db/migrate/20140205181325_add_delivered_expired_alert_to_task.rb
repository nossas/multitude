class AddDeliveredExpiredAlertToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :delivered_expired_alert, :boolean, default: false
  end
end
