class Tagging < ActiveRecord::Base
  belongs_to :tag 
  belongs_to :user
  belongs_to :place

  validates :user, :place, presence: true
end