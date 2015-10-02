require 'test_helper'

class Api::V1::LoginControllerTest < ActionController::TestCase
  setup do
    @user = User.create( :name => "toyosi", 
                         :email=> "toyosi@gmail.com",
                         :password=> "password", 
                         :password_confirmation=> "password")
  end

  test "User should be able to login with correct credentials" do
    
    post :create, {:email=> "toyosi@gmail.com",
                   :password=> "password"}

    response_body = json(response.body)
    assert_equal response_body[:loggedin], true
    refute_empty response_body[:token]
  end

  test "User should be able to logout when logged in" do
    post :create, {:email=> "toyosi@gmail.com",
                   :password=> "password"}

    response_body = json(response.body)
    request.headers["Authorization"] = "Token token=#{response_body[:token]}"

    get :logout
    logout_response = json(response.body)
    assert_response 200
    assert_equal logout_response[:message], "logged out"
    assert_equal logout_response[:loggedin], false
  end

  test "User should not be able to login with incorrect details" do
    post :create, {email: "toyosi@gmail.com",
                   password: "passworded"}
                   
    response_body = json(response.body)
    assert_response 401
    assert_equal response_body[:error], "Incorrect credentials"
  end

end
