require "rails_helper"

describe "User Registrations", js: true do
  before { visit "/#/sign-up" }

  context "when sign up information is valid" do
    let(:user) { FactoryGirl.build(:user) }

    it "should create a user and sign xem in" do
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_on "Register"

      expect(page).to have_content('Sign out')
    end
  end
end
