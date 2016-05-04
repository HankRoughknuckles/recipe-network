require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
  render_views

  ##################################################################
  # GET #index
  ##################################################################
  describe "GET #index" do
    let!(:recipe_1) { FactoryGirl.create(:recipe) }
    let!(:recipe_2) { FactoryGirl.create(:recipe) }

    it "should display the model data" do
      get :index, format: :json
      expect(json_output).to eq [
        { "name" => recipe_1.name },
        { "name" => recipe_2.name }
      ]
    end
  end
end
