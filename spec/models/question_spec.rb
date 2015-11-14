require 'rails_helper'

RSpec.describe Question, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:question).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:question, title: nil).should_not be_valid
  end
  it "is invalid without an user_id" do
    FactoryGirl.build(:question, user_id: nil).should_not be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:question, content: nil).should_not be_valid
  end
end
