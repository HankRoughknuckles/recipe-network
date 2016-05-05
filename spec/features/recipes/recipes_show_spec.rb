require 'rails_helper'

describe 'Recipe show page', js: true do
  let!(:recipe) { FactoryGirl.create(:recipe) }
  let(:show_page) { RecipesShowPage.new(recipe) }

  before { show_page.visit_page }

  it { expect(show_page).to have_recipe_name }
  it { expect(show_page).to have_recipe_description }
  it { expect(show_page).to have_recipe_instructions }
end
