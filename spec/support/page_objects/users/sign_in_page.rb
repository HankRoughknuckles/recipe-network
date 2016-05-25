class SignInPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  attr_reader :title

  def initialize
    @page_url =	'/#/sign-in'
    @title = "Sign in"

    @header_content = "Sign in"
    @email_input = "input[name=email]"
    @password_input = "input[name=password]"
    @submit_button = '.submit'
    @invalid_credentials_error = 'Invalid login credentials. Please try again.'
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


  def fill_sign_in_form(email, password)
    find(@email_input).set email
    find(@password_input).set password
    find(@submit_button).click
  end


  def sign_in_as(user)
    visit_page
    fill_sign_in_form(user.email, user.password)
  end


  def has_invalid_credentials_error?
    has_content? @invalid_credentials_error
  end
end
