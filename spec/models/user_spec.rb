require "rails_helper"

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "gets assigned a uid" do
    user.save!
    expect(user.uid).not_to be_blank
  end

  it "doesn't send a confirmation email" do
    expect{ user.save! }
      .not_to change { ActionMailer::Base.deliveries.count }
  end
end
