FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    detail { Faker::Lorem.sentence}
    category_id {rand(2..10)}
    state_id {rand(2..6)}
    fee_id {rand(2..2)}
    province_id {rand(1..47)}
    days_id {rand(2..3)}
    price {rand(300..9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    association :user
  end
end
