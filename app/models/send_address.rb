# コードレビュー

class SendAddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_number, :prefectures, :city, :address, presence: true
  validates :send_family_name, :send_first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :send_family_kana, :send_first_kana, format: { with: /\A[ぁ-んー－]+\z/ }, presence: true
end
