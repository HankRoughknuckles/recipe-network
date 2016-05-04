require "rails_helper"

describe "Recipes page", js: true do
  it "should display the model data" do
    visit '/'
    expect(page).to have_content "Cheese Bread"
  end
end
