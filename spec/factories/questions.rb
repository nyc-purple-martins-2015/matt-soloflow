FactoryGirl.define do
  factory :question do |f|
    f.title { Faker::Lorem.sentence}
    # f.user_id { 1 }
    f.user {
      FactoryGirl.create(:user)
     }
    f.content { Faker::Lorem.paragraph }
  end
end
