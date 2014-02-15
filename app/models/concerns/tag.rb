class Tag < ActiveRecord::Base
  validates :tag, presence :true
  has_many :taggings
end