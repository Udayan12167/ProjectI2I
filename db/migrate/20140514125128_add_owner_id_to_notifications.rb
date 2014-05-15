class AddOwnerIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :owner_id, :string
  end
end
