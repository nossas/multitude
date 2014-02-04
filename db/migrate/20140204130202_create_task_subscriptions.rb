class CreateTaskSubscriptions < ActiveRecord::Migration
  def change
    create_table :task_subscriptions do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end

    add_index :task_subscriptions, [:user_id, :task_id], :unique => true
  end
end
