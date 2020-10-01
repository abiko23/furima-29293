FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postnum {123-4567}
    prefecture_id {rand(1..47)}
    city {'所沢市'}
    address {'狭山ヶ丘2-28-3'}
    tel {08056924647}
  end
end
