FactoryBot.define do
  factory :address do
    postal_code { 123-4567 }
    prefecture { 3 }
    city { "あああああ" }
    address { 123 }
    phone_number {"09012345678" }
  end
end
