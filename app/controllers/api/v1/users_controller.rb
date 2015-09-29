class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all, serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    end
  end

  def show
    render json: User.find(params[:id]), serializer: UserSerializer
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

end
