class CreateMobilizations < ActiveRecord::Migration
  def up
    if Rails.env.production?
      execute "CREATE FOREIGN TABLE mobilizations(id integer, hashtag character varying(255), short_title character varying(255)) SERVER meurio OPTIONS (table_name 'mobilizations');"
    else
      create_table :mobilizations do |t|
        t.string :hashtag
        t.string :short_title
      end
    end
  end

  def down
    if Rails.env.production?
      execute "DROP FOREIGN TABLE mobilizations;"
    else
      drop_table :mobilizations
    end
  end
end
