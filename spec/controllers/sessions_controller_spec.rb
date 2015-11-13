require 'rails_helper'

describe SessionsController do
  context "#new" do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user) { FactoryGirl.create :user }
    subject { post :create, :user => { username: user.username, password: user.password, email: user.email } }

    it "redirects to root path if correct credentials" do
      expect(subject).to redirect_to questions_path(assigns[:user])
    end
  end

end

