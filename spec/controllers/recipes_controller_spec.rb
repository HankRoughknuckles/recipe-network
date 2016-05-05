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
      expect(json_output).to eq [
        { "id" => cheese_spread.id, 
          "name" => cheese_spread.name },
        { "id" => cheese_pasta.id, 
          "name" => cheese_pasta.name },
        { "id" => baked_potatoes.id, 
          "name" => baked_potatoes.name },
      ]
    end


    it "should display results similar to search term" do
      get :index, format: :json, search: "cheese"
      expect(json_output).to eq [
        { "id" => cheese_spread.id, 
          "name" => cheese_spread.name },
        { "id" => cheese_pasta.id, 
          "name" => cheese_pasta.name },
      ]
    end
  end
end
