class TaggingsController < ApplicationController

  def new
    @tagging = Tagging.new
    @place = Place.find_by(id: params[:place_id])
  end

  def create 
    @place = Place.find_by(id: params[:place_id])
    @user = User.find_by(id: session[:user_id])
    @tag = Tag.new
    @tag.tag_word = params["tagging"]["tag"]
    @tag.save
    @tagging = Tagging.new
    @tagging.user = @user
    @tagging.place = @place
    @tagging.tag = @tag
    @tagging.save
    redirect_to user_places_path(:user_id)
  end

  private

  def load_tagging

  end

  def tagging_params
    params.require(:tag).permit(:tag)
  end
end