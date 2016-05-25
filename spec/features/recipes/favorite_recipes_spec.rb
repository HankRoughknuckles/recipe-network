require "rails_helper"

describe "The Favorite Recipes page", js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let(:sign_in_page) { SignInPage.new }
  let(:navbar) { NavbarPage.new }
  let(:favorites_page) { FavoriteRecipesPage.new }


  context "when not logged in" do
    it "should redirect to login page" do
      visit '/'
      navbar.click_favorite_recipes_link
      expect(sign_in_page).to be_displayed
    end
  end


  context "when logged in" do
    before do
      sign_in_page.sign_in_as(user)
      sleep 0.5
      navbar.click_favorite_recipes_link
    end

    it { expect(favorites_page).to be_displayed }
  end
end
