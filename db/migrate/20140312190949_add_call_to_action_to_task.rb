class AddCallToActionToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :call_to_action, :string
  end
end
