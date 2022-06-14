FactoryBot.define do
  factory :item do
    item_name   {Faker::Games::Pokemon.name}
    content     {Faker::Lorem.sentence}
    category    {Category.where("id > ?", 1).sample}
    status      {Status.where("id > ?", 1).sample}
    ship_charge {ShipCharge.where("id > ?", 1).sample}
    prefecture  {Prefecture.where("id > ?", 1).sample}
    take_days   {TakeDays.where("id > ?", 1).sample}
    total_price {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
