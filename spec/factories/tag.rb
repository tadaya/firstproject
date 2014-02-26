FactoryGirl.define do
  factory :tag do
    tagword { Faker::Lorem.word(1) }
  end
end