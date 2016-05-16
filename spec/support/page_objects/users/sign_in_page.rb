class SignInPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @page_url =	'/#/sign-in'
    @title = "Sign in"
  end

  def visit_page
    visit @page_url
  end

  def visit_page_as(user)
    user.present? ? login_as(user) : logout
    visit @page_url
  end


  def fill_sign_in_form(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    find("button", text: "Sign in").click
  end
end
