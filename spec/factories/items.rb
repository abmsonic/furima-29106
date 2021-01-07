FactoryBot.define do
  factory :item do
    name           { Faker::Lorem.word }
    info           { Faker::Lorem.sentence }
    category_id    { Faker::Number.within(range: 2..11) }
    status_id      { Faker::Number.within(range: 2..7) }
    ship_fee_id    { Faker::Number.within(range: 2..3) }
    prefecture_id  { Faker::Number.within(range: 2..48) }
    ship_day_id    { Faker::Number.within(range: 2..4) }
    price          { Faker::Number.within(range: 300..9_999_999) }
    association :user
  end
end
