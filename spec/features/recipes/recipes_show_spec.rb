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
      before do
        user.add_recipe_to_favorites recipe

        # TODO: make it to where you can just do visit path instead of
        # clicking all the links in the pages to get around
        sign_in_page.sign_in_as(user)
        index_page.click_recipe(recipe)
      end

      it { expect(show_page).to have_favorited_mark }


      it "should unfavorite when clicked" do
        show_page.click_unfavorite_button 

        expect(show_page).to have_unfavorited_mark
      end
    end


    context "when not favorited by logged in user" do
      before do
        sign_in_page.sign_in_as(user)
        index_page.click_recipe(recipe)
      end

      it { expect(show_page).to have_unfavorited_mark }


      it "should favorite when clicked" do
        show_page.click_favorite_button

        expect(show_page).to have_favorited_mark
      end
    end
  end
end
