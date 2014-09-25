class CreateMemberships < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute <<-SQL
        CREATE FOREIGN TABLE memberships(id integer)
        SERVER meurio_accounts
        OPTIONS (table_name 'memberships');
      SQL
    else
      create_table :memberships
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE memberships;"
    else
      drop_table :memberships
    end
  end
end
