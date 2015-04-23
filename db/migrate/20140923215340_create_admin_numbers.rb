class CreateAdminNumbers < ActiveRecord::Migration
  def change
    create_table :admin_numbers do |t|
    	t.string :phone_number
    	t.timestamps
    end
    add_column :chats, :admin_number_id, :integer
  end
end
