require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
  render_views

  ##################################################################
  # GET #index
  ##################################################################
  describe "GET #index" do
    let!(:cheese_spread) { FactoryGirl.create(:recipe, name: "Cheese spread") }
    let!(:cheese_pasta) { FactoryGirl.create(:recipe, name: "Cheese pasta") }
    let!(:baked_potatoes) { FactoryGirl.create(:recipe, name: "Baked Potatoes") }


    it "should display all recipes when no search term present" do
      get :index, format: :json

      expect(json_output.count).to eq 3
      expect(json_output[0]).to match_response_schema("recipe")
    end


    it "should display results similar to search term" do
      get :index, format: :json, search: "cheese"

      expect(json_output.count).to eq 2
      expect(json_output[0]["name"]).to eq cheese_spread.name
    end
  end
end
