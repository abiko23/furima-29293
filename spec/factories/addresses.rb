FactoryBot.define do
  factory :address do
    postnum { rand(1_000_000..9_999_999).to_s.insert(3, '-') }
    prefecture_id { rand(1..47) }
    city { Gimei.address.city.kanji}
    address {Gimei.address.town.kanji}
    tel {rand(10_000_000..9_999_999_999)}
    association :purchase
  end
end
