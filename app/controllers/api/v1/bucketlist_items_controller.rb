class Api::V1::BucketlistItemsController < ApplicationController
  def index
    render json: BucketlistItem.all, each_serializer: BucketlistItemSerializer
  end

  def show
    render json: BucketlistItem.find(params[:id]), serializer: BucketlistItemSerializer
  end
end
