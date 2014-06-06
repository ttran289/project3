class BadgesController < ApplicationController
  def index
  	@badges = Badge.new
  	@picture = Picture.new
  	@badges = Badge.paginate(:page => params[:page], :per_page => 8)
  end
  
end
