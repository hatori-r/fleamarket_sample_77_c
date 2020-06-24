FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"新垣"}
    first_name            {"結衣"}
    family_name_kana      {"あらがき"}
    first_name_kana       {"ゆい"}
    birthday              {"19880611"}
  end
end