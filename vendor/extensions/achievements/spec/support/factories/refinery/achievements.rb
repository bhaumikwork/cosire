
FactoryGirl.define do
  factory :achievement, :class => Refinery::Achievements::Achievement do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

