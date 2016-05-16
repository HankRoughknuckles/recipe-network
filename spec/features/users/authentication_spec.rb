require 'rails_helper'

describe 'Authentication', js: true do
  let(:index_page) { RecipesIndexPage.new }
  let(:sign_in_page) { SignInPage.new }
  let!(:user) { FactoryGirl.create(:user) }


  describe 'login' do
    before { sign_in_page.visit_page }

    it 'should work with valid inputs' do
      sign_in_page.fill_sign_in_form(user.email, user.password)
      expect(index_page).to be_displayed
    end


    it "should flash an error on invalid input" do
      sign_in_page.fill_sign_in_form("wrong@wrong.com", "wrong1234")
      expect(sign_in_page).to have_invalid_credentials_error    
    end
  end
end
