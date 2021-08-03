FactoryBot.define do
  factory :merchant do
    address { FFaker::AddressBR.full_address }
    name { FFaker::NameBR.name }
  end
end
