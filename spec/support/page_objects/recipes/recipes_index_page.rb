class RecipesIndexPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @page_url = "/"
    @title = "Recipes"
  end


  def visit_page
    visit @page_url
  end


  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end


  def has_recipe?(recipe)
    has_content? recipe.name
  end


  def click_recipe(recipe)
    find(".recipe", text: recipe.name).click
  end
end
