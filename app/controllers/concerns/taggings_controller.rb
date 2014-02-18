class TaggingsController < ApplicationController

  def create 
    @place = Place.find_by(id: session[:place_id])
    @user = User.find_by(id: session[:user_id])
    binding.pry
    @user.places << @place
    redirect_to new_place_tagging_path(@place)
  end

  def new
    @place = Place.find_by(id: params[:place_id])
    @tag = Tagging.new
  end

end