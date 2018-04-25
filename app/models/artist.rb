class Artist < ApplicationRecord
  belongs_to :user
  has_many :works
  has_one :exhibition

  validates :name, presence: true

  attachment :image
end
