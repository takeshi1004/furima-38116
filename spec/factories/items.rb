FactoryBot.define do
  factory :item do
    item_name      { 'オムライス' }
    content        { '卵がふわふわ' }
    category_id    {2}
    status_id      {2}
    ship_charge_id {2}
    prefecture_id  {2}
    take_days_id   {2}
    total_price    { 5000 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
