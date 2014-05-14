class AddOwnerIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :owner_id, :integer
  end
end
