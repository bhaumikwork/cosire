
FactoryGirl.define do
  factory :block, :class => Refinery::Blocks::Block do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

