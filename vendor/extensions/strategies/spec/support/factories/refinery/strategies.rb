
FactoryGirl.define do
  factory :strategy, :class => Refinery::Strategies::Strategy do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

