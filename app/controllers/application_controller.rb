class ApplicationController < ActionController::API 
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    authenticate_token || render_unauthorized
  end

  def current_user
    @current_user
  end

  def log_in(user)
    user.loggedin = true
    user.save
  end

  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
      check_user
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: "Unauthorized", status: 401
  end

  def check_user
    if (current_user.loggedin == true) && (current_user.expire_token != DateTime.now)
      return true
    else
      return false
    end
  end


end
