FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    fullname_first {Gimei.first.kanji}
    fullname_last {Gimei.last.kanji}
    kananame_first {Gimei.first.katakana}
    kananame_last {Gimei.last.katakana}
    birth{Faker::Date.in_date_period(year:2000)}
  end
end