class Book < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :recipes

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :genre, presence: true
  validates :image, presence: true
  validates :user, presence: true
  
  enum genre: { meaty: 'meaty', avian: 'avian', fishy: 'fishy', floury: 'floury', desserty: 'desserty' }
  paginates_per 5
  max_paginates_per 100
end
