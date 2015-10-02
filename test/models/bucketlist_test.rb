require 'test_helper'

class BucketlistTest < ActiveSupport::TestCase
  test "should not create an empty bucketlist" do
    bucketlist1 = Bucketlist.new
    bucketlist2 = Bucketlist.new(name: "")

    assert_not bucketlist1.save
    assert bucketlist1.errors

    assert_not bucketlist2.save
    assert bucketlist2.errors
  end

  test "create bucketlist" do
    bucketlist = Bucketlist.new(name: "Things to do")
    assert bucketlist.save
  end

end
