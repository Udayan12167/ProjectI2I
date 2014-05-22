class AddWishlistIdToPoolGroups < ActiveRecord::Migration
  def change
    add_column :pool_groups, :wishlist_id, :integer
  end
end
