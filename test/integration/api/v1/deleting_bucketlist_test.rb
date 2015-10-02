# require 'test_helper'

# class DeletingBucketlistTest < ActionDispatch::IntegrationTest
#   setup do 
#     host! "localhost:3000/api/v1" 
#     @bucketlist = Bucketlist.create!(name: 'Crazy & dangerous') 
#     @user = User.create!( name: "toyosi", 
#                           email: "toyosi@gmail.com",
#                           password: "olatoyosi",
#                           password_confirmation: "olatoyosi",
#                           loggedin: true )
#   end

#   test "should not allow unauthorised user delete bucketlists"  do
#     delete "/bucketlists/#{@bucketlist.id}"
#     assert_equal 401, response.status
#   end

#   test "should delete a bucketlists"  do
#     delete "/bucketlists/#{@bucketlist.id}", {},
#             {"Authorization" => "Token token=#{@user.auth_token}"}
#     assert_equal 204, response.status
#   end

# end