require "rails_helper"

describe "Recipes page", js: true do
  let(:recipes_page) { RecipesIndexPage.new }
  let(:recipe_1) { FactoryGirl.create(:recipe) }

  it "should display the model data" do
    visit '/'
    expect(recipes_page).to have_recipe_with_name recipe_1.name
  end
end
