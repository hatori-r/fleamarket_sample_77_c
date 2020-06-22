class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
end
