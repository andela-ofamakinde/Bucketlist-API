class User < ActiveRecord::Base
  before_save :generate_token
  has_secure_password

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_blank: true

  has_many :bucketlists

  def generate_token
    if self.expire_token == nil || self.expire_token <= DateTime.now
    begin
      self.auth_token = SecureRandom.hex
    end while self.class.exists?(auth_token: auth_token)
    self.expire_token = DateTime.now + 2
    end
  end
  
end
