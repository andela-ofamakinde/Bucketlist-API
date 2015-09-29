class Api::V1::BucketlistItemsController < ApplicationController
  def index
    render json: BucketlistItem.all, status: 200, each_serializer: BucketlistItemSerializer
  end

  def show
    render json: BucketlistItem.find(params[:id]), status: 200, serializer: BucketlistItemSerializer
  end

  def create
   bucketlist_item = BucketlistItem.new(list_params)
   if bucketlist_item.save
    render json: bucketlist_item, status: 201
    else
    render json: bucketlist_item.errors, status: 422
    end
  end

  private
   def list_params
    params.permit(:name, :bucketlist_id, :done)
  end
end
