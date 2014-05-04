
FactoryGirl.define do
  factory :package, :class => Refinery::Packages::Package do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

