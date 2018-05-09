class Order < ApplicationRecord
  belongs_to :prefecture
  has_many :line_items, dependent: :destroy

  belongs_to :user, optional: true

  validates :name, :name_kana, :prefecture_id, :address, :zipcode, :phone, :email, :payment, :state, :payment_state, :shipment_state, presence: true


  	def add_items(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def postage
		self.prefecture.postage
	end

	def tax
		line_items.to_a.sum { |item| item.total_price } * 0.08
	end

	
end
