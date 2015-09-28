require 'test_helper'

class ListingBucketlistTest < ActionDispatch::IntegrationTest
  setup{ host! "localhost:3000/api/v1" }
  test "return a list of all the bucketlists"  do

    get '/bucketlists' , {}, { 'Accept' => Mime::JSON }

    assert_equal 200, response.status
    refute_empty response.body

    assert_equal Mime::JSON, response.content_type
  end
  

  #   test "return the list of all the bucketlists"  do
    
  #   get '/bucketlists' ,  {}, { 'Accept' => Mime::XML }

  #   assert_equal 200, response.status
  #   refute_empty response.body

  #   assert_equal Mime::XML, response.content_type
  # end
  # test "return a bucketlist by id" do
  #   bucketlist = Bucketlist.create(name: "Things to do before 50", user_id: 1)

  #   get "/bucketlists/#{bucketlist.id}"
  #   assert_equal 209, response.status

  #   bucketlist_response = json(response.body)
  #   assert_equal bucketlist.name, bucketlist_response[:name]
  # end

end
