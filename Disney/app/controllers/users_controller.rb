class UsersController < ApplicationController
	def index
		@pictures = current_user.pictures.all
	end
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@pictures = @user.pictures.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Let the Hunt begin!!"
			session[:remember_token] = @user.id.to_s
			redirect_to users_path
		else
			render :new
		end
	end

	
protected

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
