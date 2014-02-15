class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  self.has_secure_password()
  has_many :taggins
end