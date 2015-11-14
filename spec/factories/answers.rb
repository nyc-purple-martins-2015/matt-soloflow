FactoryGirl.define do
  factory :answer do
    content { Faker::Lorem.paragraph }
    question_id { 1 }
    user_id { 1 }
  end
end
