require 'rails_helper'

describe SessionsController do

  before(:each) do
    session.clear
    @user = FactoryGirl.create(:user)
  end

  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

  end

  context "#create" do

    it 'logs in a user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      expect(session[:user_id]).to eq @user.id
    end

    it 'it does not log in an invalid user' do
      user_hash = {username: @user.username, email: @user.email, password: "incorrect"}
      post :create, user_hash
      expect(session[:user_id]).to eq nil
    end

  end

  context "#destroy" do

    it 'logs out the user' do
      user_hash = {username: @user.username, email: @user.email, password: @user.password}
      post :create, user_hash
      get :destroy
      expect(session[:user_id]).to eq nil
    end

  end
end

