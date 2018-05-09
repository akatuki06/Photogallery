class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def up
	Cart.all.each do |cart|
		sums = cart.line_items.group(:work_id).sum(:quantity)

		sums.each do |work_id, quantity|
			if quantity > 1
				cart.line_items.where(work_id: work_id).delete_all
				cart.line_items.create(work_id: work_id, quantity: quantity)
			end
		end
	end
  end

  def down
	LineItem.where("quantity>1").each do |line_item|

		line_item.quantity.times do
			LineItem.create cart_id: line_item.cart_id, good_id: line_item.good_id, quantity: 1
		end

		line_item.destroy
	end
  end
end
