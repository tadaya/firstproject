class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first
      t.string :last
      t.string :city
      t.string :city2
      t.string :city3
      t.string :state
      t.string :country
      t.string :zip_code
      t.date :birthdate
      t.string :hometown
      t.text :facebook_link
      t.text :snapchat_link
      t.text :instagram_link
      t.text :twitter_link
      t.text :freeform_link
      t.text :photo_url
      t.text :description
    end
  end
end
