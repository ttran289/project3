class UsersController < ApplicationController
	def index
		@pictures = current_user.pictures.all
		@pictures = Picture.paginate(:page => params[:page], :per_page => 8)
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
			flash[:failure] = "Please enter a real email address and an 8 digit password"
			render :new
			end
	end

	
protected

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
