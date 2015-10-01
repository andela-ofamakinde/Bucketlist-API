require 'test_helper'

class CreatingBucketlistItemTest < ActionDispatch::IntegrationTest
  # setup do 
  #   host! "localhost:3000/api/v1" 
  # end
  
  # test "creates bucketlists items" do
  #   bucketlist = Bucketlist.create!(name: "Places to visit")
  #   post "/bucketlists/#{bucketlist.id}" ,
  #   { name: "Las Vegas"}.to_json,
  #   { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }

  #   assert_equal 201, response.status 
  #   refute_empty response.body
  # end

  # test "do not creates bucketlists items with empty name" do
  #   bucket = Bucketlist.create!(name: "Places to visit")
  #   post "/bucketlists/#{bucket.id}" ,
  #   { name: nil}.to_json,
  #   { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }

  #   assert_equal 422, response.status 
  # end

end