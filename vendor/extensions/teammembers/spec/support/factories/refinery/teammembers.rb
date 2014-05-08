
FactoryGirl.define do
  factory :teammember, :class => Refinery::Teammembers::Teammember do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

