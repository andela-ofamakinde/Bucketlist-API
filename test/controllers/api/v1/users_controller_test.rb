require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "should create user " do
    post :create ,:name => "toyosi", :email=> "toyosi@gmail.com",
                  :password=> "password", :password_confirmation=> "password"
    assert_response :success
    assert_equal response.status, 201

    body = json(response.body)
    assert_equal body[:user][:email], "toyosi@gmail.com"
  end

  test "should not create user with invalid details" do
    post :create ,:name => "toyosi", :email=> "toyosigmail.com", 
                  :password=> "password", :password_confirmation=> "password"

    assert_equal response.status, 422
    body = json(response.body)
    assert_equal body, { email: ["is invalid"]}
  end

  test "should show an authorized user details" do
    get(:show, {'email' => "12"}, {'user_id' => 5})
     :create ,:name => "toyosi", :email=> "toyosigmail.com", 
                  :password=> "password", :password_confirmation=> "password"

    assert_equal response.status, 422
    body = json(response.body)
    assert_equal body, { email: ["is invalid"]}
  end

end
