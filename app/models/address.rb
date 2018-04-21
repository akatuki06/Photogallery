class Address < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture

  validates :user_id, uniqueness: true
  validates :address, :zipcode, :phone, :name, :name_kana, presence: true
  validates :name_kana, format: { with: /\A[ァ-ンー－]+\z/}
end
