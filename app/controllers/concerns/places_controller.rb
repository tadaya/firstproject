class PlacesController < ApplicationController

  before_action(:load_place, { only: [:show, :edit, :update, :destroy] })

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    results = map(@place.name)
    @place.name = results[3]
    @place.lat = results[0]
    @place.long = results[1]
    @place.map_url = results[2]
    @place.save
    redirect_to places_path(@place)
  end

  def index
    @places = Place.all
  end

  def show
    load_place
    tags = @place.tags
    tag_names = tags.map{ |tag| tag.tag_word }
    unique_tags = tag_names.uniq
    tag_string = ""
    unique_tags.map do |tag_name|
      tag_string = tag_string + "#{tag_name} "
    end
    @response = word_cloud(tag_string)
    binding.pry
  end

  def edit
  end

  def update

  end

  def destroy
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
      map_url = "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=15&size=400x400&sensor=false"
      map = HTTParty.get(map_url)
      results = []
      results << lat
      results << lng
      results << map_url
      results << name
      return results
  end

  def word_cloud(textblock)

    response = Unirest::post "https://gatheringpoint-word-cloud-maker.p.mashape.com/index.php", 
    
    headers: { 
      "X-Mashape-Authorization" => "kjrsm22vKrhzPFTHnGzCYHSFbUo3BpNw"
    },

    parameters: { 
      "height" => 200,
      "textblock" => textblock,
      "width" => 300,
      "config" => "n\/a"
    }
  end
end