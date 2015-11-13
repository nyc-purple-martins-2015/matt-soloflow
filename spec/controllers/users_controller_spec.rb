require 'rails_helper'

describe UsersController do
  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'creates a new instance of the User class' do
      user = FactoryGirl.build(:user)
      expect(user).to eq(user)
    end
  end

  context "#create" do
    it "doesn't create a user when params are invalid" do
     expect {
      post :create, user: FactoryGirl.attributes_for(:user)}.to change(User, :count).by(0)
    end
  end

end
