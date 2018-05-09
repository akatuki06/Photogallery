class Image < ApplicationRecord
  belongs_to :exhibition

  attachment :image

  validates :image, presence: true
  
end
