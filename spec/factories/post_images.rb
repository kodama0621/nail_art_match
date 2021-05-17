FactoryBot.define do
  factory :post_image do
    title { Faker::Lorem.title}
    caption { Faker::Lorem.caption}
    image { File.open("#{Rails.root}/assets/images/sample.png") }
    user
  end
end