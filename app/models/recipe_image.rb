class RecipeImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :recipe
  validates :image, presence: true
  validates :description, presence: true
end
