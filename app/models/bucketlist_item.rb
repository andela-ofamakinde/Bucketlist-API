class BucketlistItem < ActiveRecord::Base
  belongs_to :bucketlist
  validates :name, presence: true
  validates :done, inclusion: {in: [true, false]}, :default => false
end
