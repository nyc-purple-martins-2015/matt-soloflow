FactoryGirl.define do
  factory :tag do |f|
    f.category { Faker::Lorem.sentence}
  end
end
