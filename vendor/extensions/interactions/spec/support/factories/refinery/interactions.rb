
FactoryGirl.define do
  factory :interaction, :class => Refinery::Interactions::Interaction do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

