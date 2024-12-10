FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.unique.name}
    email                 {Faker::Internet.email}
    password              {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {'山田'}
    firstname             {'太郎'}
    lastname_kana         {'ヤマダ'}
    firstname_kana        {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end
