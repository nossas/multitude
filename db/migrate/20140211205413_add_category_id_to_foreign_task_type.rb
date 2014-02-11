class AddCategoryIdToForeignTaskType < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE task_types ADD COLUMN category_id integer;"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE task_types DROP COLUMN category_id;"
    end
  end
end
