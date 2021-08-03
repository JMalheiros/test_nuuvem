FactoryBot.define do
  factory :purchase do
    purchaser_name { FFaker::NameBR.name }
    item_count { rand(10) }
    item
    merchant
  end
end
