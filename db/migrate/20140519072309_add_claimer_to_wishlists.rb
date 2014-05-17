class AddClaimerToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :claimer, :integer
  end
end
