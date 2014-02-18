class TagsController < ApplicationController

  before_action(:load_tag, { only: [:show, :edit, :update, :destroy] })

   before_action(:load_tagging, { only: [:show, :edit, :update, :destroy] })

  def index
  end

  def new
    @place = Place.find(params[:place_id])
    @user = User.find(params[:user_id])
    @tagging = Tagging.new
  end

  def create 
  end

  private

  def load_tagging
  end

  def tagging_params
    params.require(:tagging).permit(:tag, :type)
  end


end