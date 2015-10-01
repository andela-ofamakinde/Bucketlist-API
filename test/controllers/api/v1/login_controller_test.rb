require 'test_helper'

class Api::V1::LoginControllerTest < ActionController::TestCase

# require 'test_helper'
# module Api
#   module V1
#     class AuthorizationControllerTest < ActionController::TestCase
#       def setup
#         User.create(email: "user@email.com", password: "password")
#       end

#       test "User should be able to login and logout if correct details is supplied" do
#         post :create, {email: "user@email.com", password: "password"}
#         body = JSON.parse(response.body)

#         assert_response 200
#         assert_equal body["email"], "user@email.com"
#         assert_equal body["token"].length, 32

#         request.headers["Authorization"] = "Token token=#{body['token']}"
#         get :logout
#         assert_response 200
#         assert_equal (User.last.expired).strftime("%D"), (Time.now).strftime("%D")

#       end

#       test "User should not be able to login if incorrect details is supplied" do
#         post :create, {email: "user2@email.com", password: "password"}

#         assert_response 404
#         assert_equal response.body, "Unauthorized"
#       end

#     end
#   end
# end

end
