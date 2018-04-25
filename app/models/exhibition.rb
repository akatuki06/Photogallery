class Exhibition < ApplicationRecord
  belongs_to :artist

  has_many :clip_exhibitions, dependent: :destroy


  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, :summary, :place, :term, presence: true

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end

end
