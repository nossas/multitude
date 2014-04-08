class AlterServerMeurioAccounts < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      execute ""\
      "ALTER SERVER meurio_accounts "\
      "OPTIONS (SET host '#{ENV["MEURIO_ACCOUNTS_DBHOST"]}', SET dbname '#{ENV["MEURIO_ACCOUNTS_DBNAME"]}', ADD port '#{ENV["MEURIO_ACCOUNTS_DBPORT"]}')"

      execute ""\
      "ALTER USER MAPPING FOR #{ENV["DB_USERNAME"]} "\
      "SERVER meurio_accounts OPTIONS (SET user '#{ENV["MEURIO_ACCOUNTS_DBUSER"]}', SET password '#{ENV["MEURIO_ACCOUNTS_DBPASS"]}');"
    end
  end
end
