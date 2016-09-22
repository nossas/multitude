class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.belongs_to :user, index: true
      t.belongs_to :interest, index: true

      t.timestamps
    end
  end
end
