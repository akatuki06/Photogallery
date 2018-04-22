class Public::OrdersController < Public::Base
  before_action :set_order, only: [:show, :edit]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
	@cart = current_cart
	if @cart.line_items.empty?
		redirect_to root_path, notice: 'カートは空です。'
		return
	end
	@order = Order.new
  end

  def confirm
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_items(current_cart)
    render :new if @order.invalid?
  end

  def edit
  end

  def create
      @order = Order.new(order_params)
      @order.add_items(current_cart)
      if params[:back]
        @cart = current_cart
        render :new
      elsif @order.save
       Cart.destroy(session[:cart_id])
       session[:cart_id] = nil
       redirect_to root_url, notice: 'ご注文ありがとうございました。'
     else
      @cart = current_cart
      render :new
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id,
                                  	:prefecture_id,
                                  	:total,
                                  	:postage,
                                  	:name,
                                  	:name_kana,
                                  	:zipcode,
                                  	:address,
                                  	:phone,
                                  	:email,
                                  	:payment)
    end
end
