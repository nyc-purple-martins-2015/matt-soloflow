FactoryGirl.define do
  factory :question do |f|
    f.title { Faker::Lorem.sentence}
    f.user {
      FactoryGirl.create(:user)
     }
    f.content { Faker::Lorem.paragraph }
  end
end

FactoryGirl.define do
  factory :invalid_question do |f|
    f.title nil
    f.content "this is wrong"
  end
end
