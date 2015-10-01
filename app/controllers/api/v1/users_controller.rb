class Api::V1::UsersController < ApplicationController
  before_action :authenticate, except: [:create]
  def index
  end

  def create
    user = User.new(user_params)
    if user.save
     log_in(user)
      render json: user, status: 201, serializer: UserSerializer
    else
      render json: user.errors, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    if current_user.id == user.id
      render json: user, status: 200, serializer: UserSerializer
    else
      render json: "Unauthorised"
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

end
