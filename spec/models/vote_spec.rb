=begin editorializing

Steven does not really believe in testing ActiveReocrd association logic.  Why?
Well, you're testing the logic that's provided to you by the library you're
using.  What's the point of that?  You're duplicating tests tha tthe authors of
this framework have already written. It's not a bad thing and opinions differ,
but it's not a test that's buying you a lot of insight.

=end



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
