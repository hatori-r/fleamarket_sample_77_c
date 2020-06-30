class Item < ApplicationRecord
  
  enum status: { "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5 }

  enum shipping_fee: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1 }

  enum shipping_area: {
    "北海道":0, "青森県":1, "岩手県":2, "宮城県":3, "秋田県":4,
    "山形県":5, "福島県":6, "茨城県":7, "栃木県":8, "群馬県":9,
    "埼玉県":10, "千葉県":11, "東京都":12, '神奈川県':13, "新潟県":14,
    "富山県":15, "石川県":16, "福井県":17, "山梨県":18, "長野県":19, 
    "岐阜県":20, "静岡県":21, "愛知県":22, "三重県":23, "滋賀県":24,
    "京都府":25, "大阪府":26, "兵庫県":27, "奈良県":28, '和歌山県':29, 
    "鳥取県":30, "島根県":31, "岡山県":32, "広島県":33, "山口県":34, 
    "徳島県":35, "香川県":36, "愛媛県":37, "高知県":38, "福岡県":39,
    "佐賀県":40, "長崎県":41, "熊本県":42, "大分県":43, "宮崎県":44,
    '鹿児島県':45, "沖縄県":46
  }

  enum shipping_day: { "1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2 }

  # validates :name, presence: true
  # validates :introduce, presence: true
  # validates :status, presence: true
  # validates :shipping_fee, presence: true
  # validates :shipping_area, presence: true
  # validates :shipping_day, presence: true
  # validates :price_introduce, presence: true

  has_many :images, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  has_one :user_evaluation
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
end