FactoryBot.define do
  factory :item do
    item_name      {Faker::Name.last_name}
    content        {Faker::Lorem.sentence}
    category_id    {2}
    status_id      {2}
    ship_charge_id {2}
    prefecture_id  {2}
    take_days_id   {2}
    total_price    {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
