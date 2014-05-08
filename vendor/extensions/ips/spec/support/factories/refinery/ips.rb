
FactoryGirl.define do
  factory :ip, :class => Refinery::Ips::Ip do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

