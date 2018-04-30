class Artist < ApplicationRecord
  belongs_to :user
  has_many :works
  has_one :exhibition, dependent: :destroy
  has_many :clip_artists, dependent: :destroy


  validates :name, presence: true

  attachment :image

  def cliped_by?(user)
  	clip_artists.where(user_id: user.id).exists?
  end
end
