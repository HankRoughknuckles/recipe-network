class FavoriteRecipesPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @page_url =	favorites_v1_recipes_path
    @title = "Favorite Recipes"

    @header_content = "Favorite Recipes"
  end

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
end
