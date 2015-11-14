require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'has a valid factory' do
     FactoryGirl.create(:tag).should be_valid
  end
  it "is invalid without a category" do
    FactoryGirl.build(:tag, category: nil).should_not be_valid
  end
  it 'orders tags by created date' do
    tag = FactoryGirl.create(:tag)
    3.times do
      tag.questions << FactoryGirl.create(:question)
    end
    expect(tag.recent_questions).to eq(tag.questions.order(created_at: :desc))
  end
end
