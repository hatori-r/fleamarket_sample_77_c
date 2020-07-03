class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, :birthday ,presence: true
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }, presence: true
  has_one :send_address
  has_many :user_evaluations
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_one :credit
end
