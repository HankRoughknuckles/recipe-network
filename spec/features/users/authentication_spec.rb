require 'rails_helper'

describe 'Authentication', js: true do
  let(:index_page) { RecipesIndexPage.new }
  let(:sign_in_page) { SignInPage.new }


  describe 'login' do
    before { sign_in_page.visit_page }

    it 'should work with valid inputs' do
      user = FactoryGirl.create(:user)

      sign_in_page.fill_sign_in_form(user.email, user.password)

      expect(index_page).to have_proper_header
    end


    it "should flash an error on invalid input" do
      sign_in_page.fill_sign_in_form("wrong@wrong.com", "wrong1234")

      expect(page).to have_content(
        'Invalid login credentials. Please try again.')
    end
  end
end
