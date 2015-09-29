class ApplicationController < ActionController::API 
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_filter :authenticate_user_from_token
   
  # private 
  #   def authenticate_user_from_token
  #     authenticate_or_request_with_http_token do |token, options| 
  #     User.find_by(auth_token: token) 
  #   end 
  # end
end
