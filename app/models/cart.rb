class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_work(work_id)
		current_item = line_items.find_by_work_id(work_id)
		if current_item.blank?
		   current_item = line_items.build(work_id: work_id)
		end
		current_item
	end
	
	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

	def tax
		self.total_price * 0.08
	end
end
