class AddDefaultDoneValueToItems < ActiveRecord::Migration
  def change
    change_column :bucketlist_items, :done, :boolean, :default => false
  end
end
