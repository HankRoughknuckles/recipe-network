require 'rails_helper'

describe 'Authentication', js: true do
  describe 'login' do
    it 'should work with valid inputs' do
      @user = FactoryGirl.create(:user)
      visit '/#/sign-in'
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      find("button", text: "Sign in").click

      expect(page).to have_content('Sign out')
    end
  end
end
