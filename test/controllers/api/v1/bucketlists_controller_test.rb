require 'test_helper'

class Api::V1::BucketlistsControllerTest < ActionController::TestCase
 
  setup do 
    @user = User.create!( name: "toyosi",
                          email: "toyo@gmail.com", 
                          password: "olatoyosi",
                          password_confirmation: "olatoyosi",
                          loggedin: true )
    @bucketlist = Bucketlist.create(name: "Things to do before 50",
                                    user_id: @user.id)
  end
  
  test "should not create bucketlist with no authorisation" do
    post :create ,
         :name => "Foods to eat"
    assert_equal response.body, "Unauthorized" 
  end
  
  test "should not create bucketlist with no name" do
    request.headers["Authorization"] = "Token token=#{@user.auth_token}"
    post :create ,
          :name => "Foods to eat"
    assert_equal 201, response.status 
    refute_empty response.body
    bucketlist_response = json(response.body) 

    assert_equal "Foods to eat", bucketlist_response[:bucketlist][:name]
  end

  test "should return a list of bucketlists without authorization"  do
    get :index
    assert_equal 200, response.status
  end

  test "should not return a user bucketlists without authorization"  do
    get(:show, {'id' => "#{@bucketlist.id}" } )
    assert_equal 401, response.status
    assert_equal response.body, "Unauthorized"     
  end

  test "should return a bucketlist by id with authorisation" do
    request.headers["Authorization"] = "Token token=#{@user.auth_token}"

    get(:show, {'id' => "#{@bucketlist.id}" } )

    assert_equal 200, response.status
    bucketlist_response = json(response.body) 
    assert_equal @bucketlist.name, bucketlist_response[:bucketlist][:name]
  end

  test "should not allow unauthorised user delete bucketlists"  do
    delete(:destroy, {'id' => "#{@bucketlist.id}" } ) 
    assert_equal 401, response.status
  end

  test "should allow authorised user delete bucketlists"  do
    request.headers["Authorization"] = "Token token=#{@user.auth_token}"
    delete(:destroy, {'id' => "#{@bucketlist.id}" } ) 

    assert_equal 204, response.status
  end

end
