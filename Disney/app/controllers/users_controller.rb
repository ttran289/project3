class UsersController < ApplicationController

	has_many :pictures
	has_many :comments
end
