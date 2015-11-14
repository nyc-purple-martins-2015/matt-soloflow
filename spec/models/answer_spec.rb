require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:answer).should be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:answer, content: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:answer, question_id: nil).should_not be_valid
  end
  it "is invalid without an user_id" do
   FactoryGirl.build(:answer, user_id: nil).should_not be_valid
  end
end
