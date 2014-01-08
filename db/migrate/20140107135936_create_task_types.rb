class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name
      t.integer :points

      t.timestamps
    end
  end
end
