module ApplicationHelper

  def tag_counts(tags)
    tag_names = tags.map{ |tag| tag.tag_word }
    unique_tags = tag_names.uniq
    unique_tags.map do |tag_name|
      "#{tag_name}: #{tag_names.count(tag_name)}"
    end
  end

  def user_places(places)
    places_names = places.map { |place| place.name }
    unique_place_names = places_names.uniq
    unique_places = unique_place_names.map do |place_name|
      places.find_by(:name => place_name)
    end
    return unique_places
  end

end
