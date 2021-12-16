FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation   {password}
    last_name               {"田中"}
    last_name_kana          {"タナカ"}
    first_name              {"太郎"}
    first_name_kana         {"タロウ"}
    date_of_birth           {"1980-01-31"}
  end
end