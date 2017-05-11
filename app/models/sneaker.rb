class Sneaker < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :brand_id, presence: true
end
