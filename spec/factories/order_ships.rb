FactoryBot.define do
  factory :order_ship do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address1 { '1-2-3' }
    address2 { '東京ハイツ' }
    phone_number { '08012345678' }
  end
end
