class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :link
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :wishlists, [:user_id,:created_at]
  end
end
