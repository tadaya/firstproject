FactoryGirl.define do 
  factory :tagging do
    association :tag
    association :user
    association :place
  end
end