class NavbarPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @sign_up_link = ".sign-up"
    @sign_out_link = ".sign-out"

    @favorite_recipes_link = ".favorite-recipes"
  end

  def has_sign_up_link?
    has_css? @sign_up_link
  end

  def has_sign_out_link?
    has_css? @sign_out_link
  end

  def click_favorite_recipes_link
    find(@favorite_recipes_link).click
  end
end
