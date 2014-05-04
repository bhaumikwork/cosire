
FactoryGirl.define do
  factory :digital, :class => Refinery::Digitals::Digital do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

