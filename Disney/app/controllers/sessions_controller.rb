class SessionsController < ApplicationController
	def new
		
	end

	def create
		@user = User.where(:email => params[:session][:email]).first
		if @user == nil || !@user.authenticate(params[:session][:password])
			flash[:error] = "This is wrong!! Wrong Combination!!"
			render 'new'
		else
			session[:remember_token] = @user.id
			@current_user = @user
			redirect_to users_path
		end
	end

	def destroy
		session.delete(:remember_token)
		redirect_to sign_out_index_path
	end
end
