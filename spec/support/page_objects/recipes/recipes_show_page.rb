class RecipesShowPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize(recipe)
    @recipe = recipe
    @page_url = "/#/recipes/#{@recipe.id}"
    @title = "Recipe details"

    @header_content = @recipe.name
    @favorited_mark = ".favorited"
    @unfavorited_mark = ".unfavorited"
  end

  # for getting to the page
  def visit_page
    visit @page_url
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end


  def displayed?
    has_css? "h1", text: @header_content
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


  ##################################################################
  # favorited
  ##################################################################
  def has_favorited_mark?
    has_css? @favorited_mark
  end


  def has_unfavorited_mark?
    has_css? @unfavorited_mark
  end


  def click_favorite_button
    find(@unfavorited_mark).click # click the unfavorite mark to toggle
  end


  def click_unfavorite_button
    find(@favorited_mark).click # click the favorite mark to toggle
  end
end
