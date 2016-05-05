require 'rails_helper'

describe 'Recipes page', js: true do
  let(:recipes_page) { RecipesIndexPage.new }
  let!(:recipe_1) { FactoryGirl.create(:recipe) }

  before { recipes_page.visit_page }

  it 'should display the model data' do
    expect(recipes_page).to have_recipe recipe_1
  end

  it 'should have working links' do
    recipes_page.click_recipe recipe_1
    expect(page.title).to eq RecipesShowPage.new(recipe_1).title
  end
end
