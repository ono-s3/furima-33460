FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence }
    name               { '商品名のテスト' }
    info        { '商品の説明のテスト' }
    category_id        { 2 }
    sales_status_id       { 2 }
    shipping_fee_status_id    { 2 }
    prefecture_id      { 2 }
    scheduled_delivery_id { 2 }
    price              { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
