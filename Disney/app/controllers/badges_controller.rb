class BadgesController < ApplicationController
  def index
  	@badges = Badge.all
  end
  def show
  	@badge = Badge.find(params[:name])
  end
end
