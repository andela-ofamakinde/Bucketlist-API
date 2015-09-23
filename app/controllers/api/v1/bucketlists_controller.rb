class Api::V1::BucketlistsController < ApplicationController
  def index
    render json: Bucketlist.all, each_serializer: BucketlistSerializer
  end
   def show
    render json: Bucketlist.find(params[:id]), serializer: BucketlistSerializer
  end
  
  def destroy
    bucket = Bucketlist.find(params[:id])
    bucket.destroy
  end
end
