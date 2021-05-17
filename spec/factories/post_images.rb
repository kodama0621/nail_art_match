FactoryBot.define do
  factory :post_image do
    title { Faker::Lorem.characters(number: 5) }
    caption { Faker::Lorem.characters(number: 20) }
    user
  end
end