FactoryGirl.define do
  factory :recipe do
    sequence(:name)     { |n| "Tasty recipe #{n}" }
    description         "the description"
    instructions        "the instructions"
  end
end
