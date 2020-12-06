FactoryBot.define do
  factory :user_order do
    postal_code { "123-4567" }
    prefecture_id { 3 }
    city { "あああああ" }
    address { "あああ１ー２" }
    phone_number {"09012345678" }
  end
end
