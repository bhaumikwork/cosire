
FactoryGirl.define do
  factory :industry, :class => Refinery::Industries::Industry do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

