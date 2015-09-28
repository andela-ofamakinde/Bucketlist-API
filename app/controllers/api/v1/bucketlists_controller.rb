class Api::V1::BucketlistsController < ApplicationController
  before_filter :authenticate_user_from_token

  def index
    render json: Bucketlist.all, status: 200, each_serializer: BucketlistSerializer
  end

  def show
    render json: Bucketlist.find(params[:id]), status: 200, serializer: BucketlistSerializer
  end

  def create
   bucketlist = Bucketlist.new(list_params)
   if bucketlist.save
    render json: bucketlist, status: 201
    else
      render json: bucketlist.errors
    end
  end

  def destroy
    bucket = Bucketlist.find(params[:id])
    bucket.destroy
  end

  private
   def list_params
    params.permit(:name)
  end

  def authenticate_user_from_token
     authenticate_or_request_with_http_token do |token, options| 
      User.find_by(auth_token: token) 
      # require "pry-nav"; binding.pry
    end
  end

end
