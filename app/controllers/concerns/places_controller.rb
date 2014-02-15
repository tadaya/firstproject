class PlacesController < ApplicationController

  before_action(:load_place, { only: [:show, :edit, :update, :destroy] })

  def new
    @places = Places.all

    render(:new)
  end

  def create
    @place = Place.create(place_params)
    redirect_to places_path
  end

  def index
    @places = Place.all
  end

  def show
   @tags = @place.tags.all
  end

  def edit
  end

  def update
    @place.update(place_params)
    redirect_to places_path
  end

  def destroy
     @place.destroy
     redirect_to artists_path
  end

  private

  def load_place
    return @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name)
  end

  def map(location)
      location = location.gsub(" ", "+")
      search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{location}&sensor=true&key=AIzaSyB-SSsUvO3yxTilXyDz-ZFJoLhv0qLeUVc"
      from_google = HTTParty.get(search_url)
      lat = from_google["results"][0]["geometry"]["location"]["lat"]
      lng = from_google["results"][0]["geometry"]["location"]["lng"]
      name = from_google["results"][0]["name"]
      map_url = "http://maps.googleapis.com/maps/api/staticmap?center=#{@lat},#{@lng}&zoom=15&size=400x400&sensor=false"
      map = HTTParty.get(map_url)
  end
end