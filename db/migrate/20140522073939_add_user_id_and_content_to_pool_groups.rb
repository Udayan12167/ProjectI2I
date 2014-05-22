class AddUserIdAndContentToPoolGroups < ActiveRecord::Migration
  def change
    add_column :pool_groups, :user_id, :integer
    add_column :pool_groups, :content, :string
  end
end
