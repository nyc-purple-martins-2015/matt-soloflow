require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
end
