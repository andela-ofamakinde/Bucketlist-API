class Api::V1::BucketlistsController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    render json: Bucketlists.all, status: 200, each_serializer: AllbucketlistsSerializer
  end

  def lists
    render json: current_user.bucketlists.all, status: 200, each_serializer: AllbucketlistsSerializer
  end

  def show
    bucketlist = Bucketlist.find(params[:id])
    if current_user.id == bucketlist.user_id
      render json: bucketlist, status: 200, serializer: BucketlistSerializer
    else
      render json: "Unauthorised"
    end
  end

  def create
   bucketlist = Bucketlist.new(list_params)
   if bucketlist.save
      render json: bucketlist, status: 201
    else
      render json: bucketlist.errors, status: 422
    end
  end

  def update
    bucket = Bucketlist.find(params[:id])
    if bucket.update(list_params)
      render json: bucket, status: 200
    else
      render json: bucket.errors, status: 422
    end
  end

  def destroy
    bucket = Bucketlist.find(params[:id])
    bucket.destroy
    head 204
  end

  private
   def list_params
    params.permit(:name)
  end

end
