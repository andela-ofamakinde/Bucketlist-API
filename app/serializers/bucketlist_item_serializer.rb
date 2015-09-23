class BucketlistItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :done
end
