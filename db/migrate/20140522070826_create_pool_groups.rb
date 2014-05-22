class CreatePoolGroups < ActiveRecord::Migration
  def change
    create_table :pool_groups do |t|
      t.string :poolers

      t.timestamps
    end
  end
end
