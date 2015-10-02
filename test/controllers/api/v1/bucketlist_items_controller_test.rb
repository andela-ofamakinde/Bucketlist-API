require 'test_helper'

class Api::V1::BucketlistItemsControllerTest < ActionController::TestCase
  
  test "should not create bucketlists items with empty name" do
    post :create, :name => nil
    assert_equal 422, response.status 
  end
  
  test "creates bucketlists items" do

    post :create, :name => "Thigs to do"

    assert_equal 201, response.status 
    refute_empty response.body
  end

end
