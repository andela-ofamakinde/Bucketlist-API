class ApplicationController < ActionController::API 
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private 
    def authenticate_user_from_token
      authenticate_or_request_with_http_token do |token, options| 
      User.find_by(auth_token: token) 
    end 
  end

  def check_token
  token = request.headers["Authorization"]
  if token && action_name != 'index'
    token = token[-32..-1]
    @user = User.find_by(token: token)
    @user
  else
    nil
  end
end

 def authenticate
   authenticate_token || render_unauthorized
 end

 def render_unauthorized
   self.headers['WWW-Authenticate'] = 'Token realm="Application"'
   render json: 'Bad credentials', status: 401
 end
 
end
