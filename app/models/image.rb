class Image < ApplicationRecord
  # validates :image, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :item, optional: true

end
