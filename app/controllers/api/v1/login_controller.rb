class Api::V1::LoginController < ApplicationController
before_action :authenticate, except: [:create]

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      @user.loggedin = true
      if @user.save
        render json: { token: @user.auth_token, loggedin: @user.loggedin }
      end
      else
      render json: { error: 'Incorrect credentials' }, status: 401
    end
  end

  def logout
    @user = current_user
    @user.loggedin = false
    if @user.save
     render json: "logged out"
    end
  end

end
