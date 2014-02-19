class Tag < ActiveRecord::Base
  validates :tag_word, presence: :true
  has_many :taggings
  has_many :places, through: :taggings 
  has_many :users, through: :taggings 
end