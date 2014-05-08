
FactoryGirl.define do
  factory :space, :class => Refinery::Spaces::Space do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

