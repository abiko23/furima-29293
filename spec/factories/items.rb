FactoryBot.define do
  factory :item do
    association :user 
    name { Faker::Name.last_name }
    detail {Faker::Lorem.sentence}
    category_id {rand(1..10)}
    state_id {rand(1..6)}
    fee_id {rand(1..2)}
    province_id{rand(1..47)}
    days {rand(1..3)}
    price{rand(300..9999999)}
  end
end
