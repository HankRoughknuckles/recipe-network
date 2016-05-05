class RecipesShowPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize(recipe)
    @recipe = recipe
    @page_url = "/#/recipes/#{@recipe.id}"
    @title = "Recipe details"
  end

  # for getting to the page
  def visit_page
    visit @page_url
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end


  def has_recipe_name? 
    has_content? @recipe.name
  end


  def has_recipe_description? 
    has_content? @recipe.description
  end


  def has_recipe_instructions?
    has_content? @recipe.instructions
  end
end
