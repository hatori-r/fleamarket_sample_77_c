class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :nickname, :birthday ,presence: true
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }, presence: true
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }, presence: true

  has_many :items
  has_one :send_address
end
