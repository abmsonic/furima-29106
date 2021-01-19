FactoryBot.define do
  factory :order do
    postal_code      { "123-4567" }
    prefecture_id    { Faker::Number.within(range: 2..48) }
    city             { '東京都' }
    house_number     { '1-1' }
    building         { '東京ハイツ' }
    phone_number     { 12345678901 }
    association :user
    association :item
  end
end
