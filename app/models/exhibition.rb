class Exhibition < ApplicationRecord
  belongs_to :artist

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, :summary, :place, :term, presence: true

end
