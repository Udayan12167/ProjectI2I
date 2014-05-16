class AddContentIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :content_id, :integer
  end
end
