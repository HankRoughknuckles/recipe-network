class NavbarPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @sign_up_link = ".sign-up"
  end

  def has_sign_up_link?
    has_css? @sign_up_link
  end
end
