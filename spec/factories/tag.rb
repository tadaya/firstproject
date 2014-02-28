FactoryGirl.define do
  factory :tag do
    tag_word { Faker::Lorem.word }
  end
end