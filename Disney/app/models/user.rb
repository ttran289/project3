require "bcrypt"
class User < ActiveRecord::Base
	has_many :pictures
	has_many :badges, through: :user_badges
	has_many :user_badges
	has_secure_password
	
end
