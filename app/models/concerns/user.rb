class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  self.has_secure_password()
  has_many :places, through: :taggings
  has_many :tags, through: :taggings
end