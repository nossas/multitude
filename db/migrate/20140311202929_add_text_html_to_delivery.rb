class AddTextHtmlToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :text_html, :text
  end
end
