class AddNameToChat < ActiveRecord::Migration
  def change
    add_column :chats, :name, :string
    add_column :chats, :status, :string
  end
end
