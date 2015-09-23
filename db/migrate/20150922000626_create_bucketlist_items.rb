class CreateBucketlistItems < ActiveRecord::Migration
  def change
    create_table :bucketlist_items do |t|
      t.string :name
      t.boolean :done
      t.references :bucketlist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
