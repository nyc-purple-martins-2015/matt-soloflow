require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:answer).should be_valid
  end
end
