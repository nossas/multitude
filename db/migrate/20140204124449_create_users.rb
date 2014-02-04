class CreateUsers < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute ""\
        "CREATE FOREIGN TABLE users(id integer NOT NULL, email character varying(255) DEFAULT ''::character varying NOT NULL, first_name character varying(255) NOT NULL, last_name character varying(255) NOT NULL, avatar character varying(255), skills character varying(255)[] DEFAULT '{}'::character varying[]) "\
        "SERVER meurio_accounts "\
        "OPTIONS (table_name 'users');"
    else
      execute "CREATE TABLE users(id integer NOT NULL, email character varying(255) DEFAULT ''::character varying NOT NULL, first_name character varying(255) NOT NULL, last_name character varying(255) NOT NULL, avatar character varying(255), skills character varying(255)[] DEFAULT '{}'::character varying[])"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE users;"
    else
      execute "DROP TABLE users;"
    end
  end
end
