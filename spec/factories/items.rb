FactoryBot.define do
  factory :item do
    name {"帽子"}
    price {"500"}
    detail {"可愛いです"}
    category_id {"レディース"}
    quality_id {"新品・未使用"}
    prefecture_id {"北海道"}
    shipped_date_id {"1~2日で発送"}
    shipment_burden_id {"着払い（購入者負担）"}
    user_id {"2"}
  end
end
