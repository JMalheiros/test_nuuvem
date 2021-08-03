FactoryBot.define do
  factory :item do
    description { FFaker::Lorem.sentence }
    price { rand(0..10.0) }
  end
end
