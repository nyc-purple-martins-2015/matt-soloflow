require 'rails_helper'

describe QuestionsController do
let(:invalid_question) {FactoryGirl.create(:invalid_question)}
let(:question) {FactoryGirl.create(:question)}
let(:new_user) {FactoryGirl.create(:user)}
let(:tags) {FactoryGril.create(:tag)}

  context "#index" do

    it 'is successful' do
      get :index
      expect(response).to be_success
    end

    it 'creates a collection of all questions' do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context "#new" do

    it 'creates a new question' do
      get :new
      expect(assigns(:question)).to be_a_kind_of(Question)
    end
  end

  context "#create" do

    before(:each) {
      @user = create(:user)
      session[:user_id] = @user.id
    }

    it 'creates a new contact' do
      question_hash = attributes_for(:question)
      question_hash[:tags] = "one,two,three"
      expect {
        post :create, question: question_hash
      }.to change(Question, :count).by(1)
    end

    it 'redirects to the question after success' do
      question_hash = attributes_for(:question)
      question_hash[:tags] = "one,two,three"
      post :create, question: question_hash
      expect(response).to redirect_to(question_path(2))
    end

    it 'renders new form when save is attributes are invalid' do
      question_hash = {title: nil, content: nil}
      question_hash[:tags] = "one,two,three"
      post :create, question: question_hash
      expect(response).to render_template(:new)
    end
  end
end
