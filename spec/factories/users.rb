FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    last_name             {Faker::Japanese::Name.last_name}
    first_name_kana       {Faker::Japanese::Name.first_name.yomi}
    last_name_kana        {Faker::Japanese::Name.last_name.yomi}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
