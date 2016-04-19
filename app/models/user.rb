class User < ActiveRecord::Base
	#User can have many secrets, secrets can have many users through likes
	# has_many :secrets
	# has_many :likes, dependent: :destroy
	# has_many :secrets_liked, through: :likes, source: :secret
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  # validates :email, uniqueness: true
end
