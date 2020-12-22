FactoryBot.define do
  factory :order do
    place_id              {Faker::Number.between(from: 1,to:47)}
    address               {"青山-1"}
    city                  {"練馬区"}
    address_number        {"000-0000"}
    building              {"ライオンズマンション"}
    phone_number          {Faker::Number.leading_zero_number(digits: 10)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
