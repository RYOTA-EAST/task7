FactoryBot.define do
  factory :todo do
    name { Faker::Lorem.characters(number:20) }
    description { Faker::Lorem.characters(number:20) }
  end
end