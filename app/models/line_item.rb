class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :work
  belongs_to :cart

  def total_price
  	work.price * quantity
  end
end
