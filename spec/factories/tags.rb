FactoryGirl.define do
  factory :tag do
    factory :question do |f|
    f.title { Faker::Lorem.sentence}
    f.user_id { 1 }
    f.content { Faker::Lorem.paragraph }
  end
end
