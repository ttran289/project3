class PicturesController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@pictures = Picture.all
	end

	# def all
	# 	@pictures = Picture.all.reverse.paginate(:page => params [:page], :per_page => 10)
	# end

	def show
		@picture = Picture.find(params[:id])
		@comments = @picture.comments
	end

	def new
		@picture = Picture.new
	end

	def edit

	end

	def create
		@picture = current_user.pictures.new(post_params)
		if @picture.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update

	end

	def destroy
		Picture.find(params[:id]).destroy
		redirect_to root_path
	end


	private
		
		def post_params
			params.require(:picture).permit(:caption, :picture)
		end

		def set_post
			@picture = Picture.find(params[:id])
		end
end
