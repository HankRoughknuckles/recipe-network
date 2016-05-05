class RecipesShowPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize(recipe)
    @recipe = recipe
    @page_url = "/#/recipes/#{@recipe.id}"
    @title = "Recipe details"
  end

  def visit_page
    visit @page_url
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end
end
