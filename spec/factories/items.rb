FactoryBot.define do
  factory :item do
    item_name             { '商品名(Item)（Ｉｔｅｍ）アイテムあいてむ１２３４５６７８９０ｱｲﾃﾑ1234567890' }
    item_text             { '商品説明(Text)（Ｔｅｘｔ）テキストてきすと０１２３４５６７８９０ﾃｷｽﾄ1234567890' }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    sales_status_id       { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id      { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id      { Faker::Number.between(from: 2, to: 48) }
    day_to_ship_id        { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io:File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
