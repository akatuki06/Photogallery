class Artist < ApplicationRecord
  belongs_to :user
  has_many :works

  validates :name, presence: true

  attachment :image
end
