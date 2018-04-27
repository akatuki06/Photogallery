class Admin::OrdersController < Admin::Base
	before_action :authenticate_admin!
  before_action :set_order, except: [:index]


  def index
  	@orders = Order.all.reverse_order
  end

  def show
  end

  def edit
  end

  def update
    if params[:delete]
      @order.line_items.each do |li|
      li.work.update!(stock: li.work.stock + li.quantity)
      end
      @order.update!(is_deleted: true)
      redirect_to admin_order_path(@order), notice: "削除しました"
      return
  	elsif
     @order.update(order_params)
  		redirect_to admin_order_path(@order), notice: "更新しました"
  	else
  		render :edit
  	end

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
  	params.require(:order).permit(:name,
								  	:name_kana,
								  	:zipcode,
								  	:prefecture_id,
								  	:address,
								  	:phone,
								  	:payment,
								  	:payment_state,
								  	:state,
								  	:shipment_state)
  end



end
