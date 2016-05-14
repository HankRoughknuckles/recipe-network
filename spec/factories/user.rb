FactoryGirl.define do
  factory :user do
    sequence(:email)        { |n| "person#{n}@example.com" }
    password                { "asdfasdf" }
    password_confirmation   { "asdfasdf" }

    factory :confirmed_user do
      confirmed_at Time.zone.now
    end
  end
end
