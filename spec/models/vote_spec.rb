require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'has a valid factory' do
    FactoryGirl.create(:vote).should be_valid
  end
  it 'is invalid without a votable_type' do
    FactoryGirl.build(:vote, votable_type: nil).should_not be_valid
  end
  it 'is invalid without a votable_id' do
    FactoryGirl.build(:vote, votable_id: nil).should_not be_valid
  end
  it 'is invalid without a user_id' do
    FactoryGirl.build(:vote, user_id: nil).should_not be_valid
  end
  it 'is invalid without a value' do
    FactoryGirl.build(:vote, value: nil).should_not be_valid
  end
end
