class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :lat
      t.string :long
      t.text :facebook_link
      t.text :snapchat_link
      t.text :instagram_link
      t.text :twitter_link
      t.text :freeform_link
      t.text :picture_url
      t.text :map_url
    end
  end
end
