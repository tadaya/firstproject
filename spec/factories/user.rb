FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email } 
    first { Faker::Name.first_name }
    last { Faker::Name.last_name }
    password_digest "hello"
  end
end