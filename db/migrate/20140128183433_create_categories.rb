class CreateCategories < ActiveRecord::Migration
  def up
    if Rails.env.production?
      execute "CREATE FOREIGN TABLE categories(id integer, name character varying(255)) SERVER meurio OPTIONS (table_name 'categories');"
    else
      create_table :categories do |t|
        t.string :name
      end
    end
  end

  def down
    if Rails.env.production?
      execute "DROP FOREIGN TABLE categories;"
    else
      drop_table :categories
    end
  end
end