class Place < ActiveRecord::Base
  validates :lat, presence: true
  validates :long, presence: true
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :users, through: :taggings
end