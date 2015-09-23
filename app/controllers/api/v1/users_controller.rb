class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end
  def create
   render json: User.new(user_params)
  end
  def show
    render json: User.find(params[:id])
  end

  private
   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
