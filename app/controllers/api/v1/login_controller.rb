class Api::V1::LoginController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # if loged in, token should be passed to the url header
      # require "pry-nav"; binding.pry
      render json: { token: user.auth_token }
    else
      render json: { error: 'Incorrect credentials' }, status: 401
    end
  end

  def delete
    @current_user = nil
  end

end
