class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  #has_secure_password
  has_many :taggings
  has_many :places, through: :taggings


  def checkin(place)
    self.places << place
  end
end