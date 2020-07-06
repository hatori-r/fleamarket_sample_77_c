FactoryBot.define do
  factory :item do
    name              {"ゴルフクラブセット"}
    introduce         {"Callawayのゴルフクラブセットです。
    メンズゴルフクラブ14点フルセット 右用"}
    status            {"目立った傷や汚れなし"}
    shipping_fee      {"送料込み(出品者負担)"}
    shipping_area     {"埼玉県"}
    shipping_day      {"1~2日で発送"}
    price_introduce   {"30000"}
    category_id       {"962"}
  end
end