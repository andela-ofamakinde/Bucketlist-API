class ApplicationController < ActionController::API 
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
      if @current_user.loggedin == true && (@current_user.expire_token != DateTime.now)
        return true
      # elsif @current_user.expire_token == DateTime.now
      #   render json: "Log in to use the app"
      #   return false
      else
        return false
      end
    end
  end

  def current_user
    @current_user
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: "Unauthorized", status: 401
  end
end
