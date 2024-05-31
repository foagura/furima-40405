FactoryBot.define do
  factory :buy_order do
    postal_code {Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id {rand(2..48)}
    municipalities {Gimei.city.kanji}
    address {rand(1..9)}
    building_name {"TESTビル"}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
    token {Faker::Crypto.md5}
  end
end
