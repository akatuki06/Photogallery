class Work < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :stock, presence: true

  attachment :image
  
end
