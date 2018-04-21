class Work < ApplicationRecord
  belongs_to :artist
  belongs_to :user

  validate :price_validate
  validate :stock_validate

  validates :title, :image, presence: true

  #priceフィールドに数字か入力されているか検証。
  validates_numericality_of :price, :stock,
  :message => "が有効な数値ではありません。"

  # validates_format_of :image,
  # :with => /\a|\.jpg$|\.png$|\.gif$\z/,
  # :message => "はGIF,JPG,PNG画像でなければなりません。"

  attachment :image

  acts_as_taggable

  #商品の価格が正の数であることを確認する。
	#価格フィールドが空でないときだけチェックをする。
	protected
	def price_validate
		errors.add(:price, "は0より大きくなければなりません。") unless price.nil? || price > 0.0
	end

  def stock_validate
    errors.add(:stock, "は0より大きくなければなりません。") unless stock.nil? || stock > 0.0
  end
end
