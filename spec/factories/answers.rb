# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  factory :answer do
    content { Faker::Lorem.paragraph }
    question_id { 1 } # I would argue we don't want to hard code these.
    user_id { 1 }
    best { true }

    # A fun idea here would be to "subclass" this factory by creating a factory
    # called "best_answer" which would only override this attribute
  end
end
