require 'test_helper'

class BucketlistItemTest < ActiveSupport::TestCase
  test "should not create an empty bucketlist item" do
    bucketlist_item1 = BucketlistItem.new
    bucketlist_item2 = BucketlistItem.new(name: "")

    assert_not bucketlist_item1.save
    assert_not bucketlist_item2.save
  end

  test "create bucketlist item" do
    bucketlist_item = BucketlistItem.new(name: "Go go to do babe")
    assert bucketlist_item.save
  end
  
end
