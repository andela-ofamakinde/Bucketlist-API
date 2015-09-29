# require 'test_helper'

# class CreatingBucketlistTest < ActionDispatch::IntegrationTest
#   setup do 
#     host! "localhost:3000/api/v1" 
#   end
  
#   test "creates bucketlists" do
#     post "/bucketlists" ,
#       { name: "Things to do before 50"}.to_json,
#       { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
#     assert_equal 201, response.status 
#     refute_empty response.body
#   end

#   test "does not create bucketlist with no name" do
#     post "/bucketlists" ,
#       { name: ""}.to_json,
#       { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }
#     assert_equal 422, response.status 
#   end

# end