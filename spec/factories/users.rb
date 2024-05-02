FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Gimei.name.last }
    first_name            { Gimei.name.first }
    last_name_kana        { Gimei.name.last.katakana }
    first_name_kana       { Gimei.name.first.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
