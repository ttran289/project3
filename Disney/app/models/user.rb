require "bcrypt"
class User < ActiveRecord::Base
	# this will validates email registration
	before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }, on: :create
	has_many :pictures
	has_many :badges, through: :pictures
	has_many :user_badges
	# use for gem bcrypt
	has_secure_password
	
end
