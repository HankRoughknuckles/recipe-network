require "rails_helper"

describe "The Favorite Recipes page", js: true do
  let(:sign_in_page) { SignInPage.new }
  let(:navbar) { NavbarPage.new }
  let(:favorites_page) { FavoriteRecipesPage.new }
  let!(:user) { FactoryGirl.create(:user) }

  context "when not logged in" do
    it "should redirect to login page"
  end


  context "when logged in" do
    before do
      sign_in_page.sign_in_as user
      navbar.click_favorite_recipes_link
    end

    it { expect(favorites_page).to be_displayed }
  end
end
