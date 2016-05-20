require 'rails_helper'

describe 'Recipe show page', js: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:recipe) { FactoryGirl.create(:recipe) }
  let(:sign_in_page) { SignInPage.new }
  let(:index_page) { RecipesIndexPage.new }
  let(:show_page) { RecipesShowPage.new(recipe) }

  before { show_page.visit_page }

  it { expect(show_page).to have_recipe_name }
  it { expect(show_page).to have_recipe_description }
  it { expect(show_page).to have_recipe_instructions }

  describe "favoriting" do
    context "when not logged in" do
      it "should not be favorited" do
        expect(show_page).to have_unfavorited_mark
      end
    end


    context "when favorited by the logged in user" do
      it "should have favorited status when favorited by a user" do
        user.add_recipe_to_favorites recipe

        sign_in_page.sign_in_as(user)
        index_page.click_recipe(recipe)
        # TODO: make it to where you can just do visit path instead of
        # clicking all the links in the pages to get around
        
        expect(show_page).to have_favorited_mark
      end
    end


    it "should not show favorited if not favorited by user" do
      sign_in_page.sign_in_as user
      index_page.click_recipe(recipe)

      expect(show_page).to have_unfavorited_mark
    end
  end
end
