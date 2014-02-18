class Tag < ActiveRecord::Base
  validates :tag, presence: :true
  has_many :taggings
  has_many :places, through: :taggings 
  has_many :users, through: :taggings 
end