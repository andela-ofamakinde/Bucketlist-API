# require 'test_helper'

# class DeletingBucketlistTest < ActionDispatch::IntegrationTest
#   setup do 
#     host! "localhost:3000/api/v1" 
#     @bucketlist = Bucketlist.create!(name: 'Crazy & dangerous') 
#   end

#   test "delete a bucketlists"  do
#     delete "/bucketlists/#{@bucketlist.id}"
#     assert_equal 204, response.status
#   end
# end