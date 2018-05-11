module ApplicationHelper

	def link_to_add_fields(name, f, association, locals={})
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: [locals[:class], "add_fields"], data: {id: id, fields: fields.gsub("\n", "")})
	end

	def order_total(total_price, tax, postage)
		total_price + tax + postage
	end


	# 遠藤さんヘルプ

	# admin_artist_index
	def sum(ordered_items)
		sum = 0
       	ordered_items.each do |oi|
       		oi_total = oi.price * oi.quantity
			total_sale = oi_total * 0.8
    		taxin_total = total_sale * 1.08
		   sum = sum + taxin_total
        end
        return sum
	end

	def tax(oi)
		oi.artist_item_total * 0.08
	end

	def artist_total(ordered_items)
		sum = 0
		ordered_items.each do |oi|
			total = oi.artist_item_total + tax(oi)
            sum = sum + total
        end
        return sum
	end

	

end