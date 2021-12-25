FactoryBot.define do
  factory :order_address do
    post_code             { '123-4567' }
    prefectures_id        { Faker::Number.between(from: 2, to: 48) }
    municipalities        { '東京都' }
    address               { '港区1-1' }
    building_num          { '東京ハイツ1011' }
    telephone_num         { '09012345678' }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
