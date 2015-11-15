require 'rails_helper'

feature 'Unlogged user browsing the website' do

  before(:each) do
    @question = FactoryGirl.create(:question)
  end

  context "on a homepage" do
    it "should display questions" do
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

    it "should display an tag button to not logged in user" do
      visit root_path
      click_button("All Tags")
    end
  end
end
