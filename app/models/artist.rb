class Artist < ApplicationRecord
  belongs_to :user
  has_many :works
  has_one :exhibition
  has_many :clip_artists, dependent: :destroy


  validates :name, presence: true

  attachment :image

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
