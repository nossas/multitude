class MigrateTableTaskTypesToMeurio < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "DROP TABLE IF EXISTS task_types CASCADE;"
      execute "CREATE FOREIGN TABLE task_types(id integer, name character varying(255), points: integer) SERVER meurio OPTIONS (table_name 'task_types');"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE task_types;"
    end
  end
end
