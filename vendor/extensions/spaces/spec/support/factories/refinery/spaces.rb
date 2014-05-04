
FactoryGirl.define do
  factory :space, :class => Refinery::Spaces::Space do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

