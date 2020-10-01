FactoryBot.define do
  factory :address do
    postnum {rand(1000000..9999999).to_s.insert(3, "-")}
    prefecture_id {rand(1..47)}
    city { Gimei.address.city.kanji}
    address {Gimei.address.town.kanji}
    tel {rand(10000000..9999999999)}
    association :purchase
  end
end
