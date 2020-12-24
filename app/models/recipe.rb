class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :book
  has_many   :recipe_images
  
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  
  paginates_per 5
  max_paginates_per 100
end
