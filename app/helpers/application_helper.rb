module ApplicationHelper
  def sayhello
    return "Tai says hi!"
  end


  def tag_counts(tags)
    tag_names = tags.map{ |tag| tag.tag }
    unique_tags = tag_names.uniq
    unique_tags.map do |tag_name|
      "#{tag_name}: #{tag_names.count(tag_name)}"
    end
  end
end
