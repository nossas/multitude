class CreateUserMappingForNewDbUsername < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER meurio OPTIONS (user '#{ENV["MEURIO_DBUSER"]}', password '#{ENV["MEURIO_DBPASS"]}');"
      execute "CREATE USER MAPPING for #{ENV["DB_USERNAME"]} SERVER meurio_accounts OPTIONS (user '#{ENV["MEURIO_ACCOUNTS_DBUSER"]}', password '#{ENV["MEURIO_ACCOUNTS_DBPASS"]}');"
    end
  end

  def down
  end
end
