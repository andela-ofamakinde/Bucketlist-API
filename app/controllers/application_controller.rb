class ApplicationController < ActionController::API 

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_filter :authenticate_user_from_token

  # def token
  #  authenticate_with_http_basic do |email, password|
  #   user = User.find_by(email: email)
  #   if user && user.password == password
  #     render json: { token: user.auth_token }
  #   else
  #     render json: { error: 'Incorrect credentials' }, status: 401
  #   end
  #  end
  # end
 
  private
  
  def authenticate_user_from_token
     authenticate_or_request_with_http_token do |token, options| 
      User.find_by(auth_token: token) 
    end
    
  end
end
