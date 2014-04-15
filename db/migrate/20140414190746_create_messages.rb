class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :from
      t.string :to
      t.boolean :is_incoming

      t.timestamps
    end
  end
end
