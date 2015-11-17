require 'rails_helper'

# Remember when we had a really fun discussion about hidden eager loading
# expectations?  That was a great day.
feature 'Unlogged user visits the homepage' do
  describe "user sees the index of questions" do

    let!(:question) { FactoryGirl.create(:question, title: "Test question 1") }

    it "should display all questions" do
      visit root_path
      expect(page).to have_content(question.title)
    end

    it "should display the author of the question" do
      visit root_path
      expect(page).to have_content(question.user.username)
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
