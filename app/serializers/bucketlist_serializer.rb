class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :created_by

  has_many :bucketlist_items
  def created_by
    "#{object.user_id}"
  end
end
