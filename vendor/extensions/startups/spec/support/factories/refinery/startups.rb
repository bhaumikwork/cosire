
FactoryGirl.define do
  factory :startup, :class => Refinery::Startups::Startup do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

