
FactoryGirl.define do
  factory :brand, :class => Refinery::Brands::Brand do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

