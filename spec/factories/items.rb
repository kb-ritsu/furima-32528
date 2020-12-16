FactoryBot.define do
  factory :item do
    association :user
    name                  {"竹の子"}
    price                 {Faker::Number.between(from: 300,to:999999)}
    category_id           {Faker::Number.between(from: 1,to:10)}
    status_id             {Faker::Number.between(from:1 ,to:6)}
    fee_id                {Faker::Number.between(from: 1,to:2)}
    place_id              {Faker::Number.between(from: 1,to:47)}
    detail                {"商品の説明（必須 1,000文字まで）（色、素材、重さ、定価、注意点など）例）2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"}
    day_id                {Faker::Number.between(from: 1,to:3)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
