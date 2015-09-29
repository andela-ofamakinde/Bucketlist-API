class BucketlistItem < ActiveRecord::Base
  belongs_to :bucketlist
  validates :name, presence: true, length: { minimum: 1 }
  # validates :done, inclusion: {in: [true, false]}, :default => false
end
