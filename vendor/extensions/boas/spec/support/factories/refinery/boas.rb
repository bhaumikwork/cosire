
FactoryGirl.define do
  factory :boa, :class => Refinery::Boas::Boa do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

