class AddClaimedToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :claimed, :integer
  end
end
