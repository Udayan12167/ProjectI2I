class AddPoolersToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :poolers, :string
  end
end
