class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :work
  belongs_to :cart

  def total_price
  	work.price * quantity
  end

  def artist_item_total
  	work.price * quantity * 0.8
  end

  # def artist_item_tax
  # 	 lineItem.to_a.sum { |item| item.artist_item_total } * 0.08
  # end

end
