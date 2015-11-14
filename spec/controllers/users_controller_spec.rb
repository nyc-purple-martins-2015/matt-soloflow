require 'rails_helper'

describe UsersController do

  before(:each) do
    @new_user = FactoryGirl.create(:user)
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
    # it "creates sets the session user_id to the current user id" do
    #   post :create, user: FactoryGirl.attributes_for(:user)

    #   expect(session[:user_id]).to eq(FactoryGirl.attributes_for(:user)[:id])
    # end

    it "redirects to login path when user is created" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to questions_path
    end

    # ON ICE
    # it "doesn't create a user when params are invalid" do
    #   post :create
    #   expect(response).to render(:new)
    # end

  end

  # ON ICE
  # context '#show' do
  #   it "assigns the current user" do
  #     get :show, @new_user
  #     expect(@new_user).to eq(@user)
  #   end
  # end

end
