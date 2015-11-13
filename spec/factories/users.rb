FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name}
    email { Faker::Internet.email }
    password {Faker::Internet.password }
  end

  factory :invalid_user do
    username ""
    email ""
    password ""
  end
end
