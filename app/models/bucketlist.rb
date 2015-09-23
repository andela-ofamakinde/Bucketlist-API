class Bucketlist < ActiveRecord::Base
  belongs_to :user
  has_many :bucketlist_items
  validates :name, presence: true
end
