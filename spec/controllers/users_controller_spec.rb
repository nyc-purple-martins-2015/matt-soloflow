require 'rails_helper'

describe UsersController do

  before(:each) do
    @new_user = FactoryGirl.create(:user)
    @invalid_user = User.new(username: nil, email: nil, password: nil)
  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'creates a new instance of the User class' do
      get :new
      expect(assigns(:user)).to be_a_kind_of(User)
    end

  end

  context "#create" do
    it "creates a user when params are valid" do
      expect {
      post :create, user: FactoryGirl.attributes_for(:user)}.to change(User, :count).by(1)
    end


    # ON ICE
    # it "doesn't create a user when params are invalid" do
    #   expect{
    #     post :create, user: @invalid_user
    #     }.to change(User, :count).by(0)
    # end

  end

end
