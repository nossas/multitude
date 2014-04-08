class AlterServerMeurioAccounts < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      execute ""\
      "ALTER SERVER meurio_accounts "\
      "OPTIONS (host '#{ENV["MEURIO_ACCOUNTS_DBHOST"]}', dbname '#{ENV["MEURIO_ACCOUNTS_DBNAME"]}')"

      execute ""\
      "ALTER USER MAPPING FOR #{ENV["DB_USERNAME"]} "\
      "SERVER meurio_accounts OPTIONS (user '#{ENV["MEURIO_ACCOUNTS_DBUSER"]}', password '#{ENV["MEURIO_ACCOUNTS_DBPASS"]}');"
    end
  end
end
