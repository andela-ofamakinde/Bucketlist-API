require 'test_helper'

class CreatingBucketlistTest < ActionDispatch::IntegrationTest
  setup do 
    host! "localhost:3000/api/v1" 
    @user = User.create!(name: "toyosi", email: "toyo@gmail.com", password: "olatoyosi",
                         password_confirmation: "olatoyosi")
  end
  
  test "does not create bucketlist with no authorisation" do
    post "/bucketlists" ,
      { name: "Foods to eat"}.to_json
    assert_equal 401, response.status 
  end
  
  test "creates bucketlists" do
    post "/bucketlists" ,
      { name: "Things to do before 50"},
      {"Authorization" => "Token token=#{@user.auth_token}"}

    assert_equal 201, response.status 
    refute_empty response.body

    bucketlist_response = json(response.body) 
    assert_equal "Things to do before 50", bucketlist_response[:bucketlist][:name]
  end

  test "does not create bucketlist with no name" do
    post "/bucketlists" ,
      { name: ""}.to_json,
      { "Authorization" => "Token token=#{@user.auth_token}"}
    assert_equal 422, response.status 
  end


end