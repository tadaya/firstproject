class Place < ActiveRecord::Base
  validates :lat, presence: true
  validates :long, presence: true
  has_many :taggings
end