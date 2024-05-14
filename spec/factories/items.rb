FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    category_id {rand(2..11)}
    condition_id {rand(2..7)}
    shipping_charge_id {rand(2..3)}
    prefecture_id {rand(2..48)}
    days_to_ship_id {rand(2..4)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    
    association :user
    
    after(:build, :create) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
