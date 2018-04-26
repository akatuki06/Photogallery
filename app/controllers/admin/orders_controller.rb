class Admin::OrdersController < Admin::Base
	before_action :authenticate_admin!


  def index
  	@orders = Order.all.reverse_order
  end

  def show
  	@order = Order.find(params[:id])
  end

  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	if @order.update(order_params)
  		redirect_to admin_order_path(@order), notice: "更新しました"
  	else
  		render :edit
  	end

  end

  private

  def order_params
  	params.require(:order).permit(:name,
								  	:name_kana,
								  	:zipcode,
								  	:prefecture,
								  	:address,
								  	:phone,
								  	:payment,
								  	:payment_state,
								  	:state,
								  	:shipment_state)
  end



end
