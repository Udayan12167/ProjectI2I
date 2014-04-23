class AddNotifcountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notifcount, :integer
  end
end
