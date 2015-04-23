class AddAdminNumber < ActiveRecord::Migration
  def change
  	add_column :chats, :admin_number, :string
  end
end
