require 'test_helper'

class ListingBucketlistTest < ActionDispatch::IntegrationTest
  setup do
   host! "localhost:3000/api/v1" 
   @user = User.create!(name: "toyosi", email: "toyosi@gmail.com", password: "olatoyosi",
                         password_confirmation: "olatoyosi")
   @bucketlist = Bucketlist.create(name: "Things to do before 50", user_id: 1)
  end

  test "return a list of all the bucketlists"  do
    get '/bucketlists'

    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Mime::JSON, response.content_type
  end

  test "dont return a list of bucketlists without authorization"  do
    get "/bucketlists/#{@bucketlist.id}"
    assert_equal 401, response.status
  end

  test "return a bucketlist by id" do

    get "/bucketlists/#{@bucketlist.id}", {},
          { "Authorization" => "Token token=#{@user.auth_token}" }
    assert_equal 200, response.status
    bucketlist_response = json(response.body) 
    assert_equal @bucketlist.name, bucketlist_response[:bucketlist][:name]
  end

end
