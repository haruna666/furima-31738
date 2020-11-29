FactoryBot.define do
  factory :item do
    name { "あああ" }
    price {500}
    detail { "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ" }
    category_id {2}
    quality_id {2}
    prefecture_id {2}
    shipped_date_id {2}
    shipment_burden_id {2}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
