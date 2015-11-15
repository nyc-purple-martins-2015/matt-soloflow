require 'rails_helper'

feature 'Unlogged user visits the homepage' do

  before(:each) do
    @question = FactoryGirl.create(:question)
  end

  describe "user sees the index of questions" do
    it "should display all questions" do
      visit root_path
      expect(page).to have_content(@question.title)
    end

    it "should display the author of the question" do
      visit root_path
      expect(page).to have_content(@question.user.username)
    end

    it "should not display an ask button to not logged in user" do
      visit root_path
      expect(page).to have_no_content("Ask")
    end

    it "should display a tag button to not logged in user" do
      visit root_path
      click_button("All Tags")
    end
  end
end

# feature 'User signs up' do

#   it "should allow a user to sign up and redirect to root" do
#     visit root_path
#     click_link "Sign Up"
#     fill_in "Username", with: "user"
#     fill_in "Email", with: "user@example.com"
#     fill_in "Password", with: "password"
#     click_button "Create User"
#     current_path.to eq(root_path)
#   end
# end
