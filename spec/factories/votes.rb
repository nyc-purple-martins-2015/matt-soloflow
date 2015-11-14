FactoryGirl.define do
  factory :vote do
    value { 1 }
    votable_type { "comment" }
    votable_id { 1 }
    user_id { 1 }
  end
end
