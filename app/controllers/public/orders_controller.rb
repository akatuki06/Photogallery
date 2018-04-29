class Public::OrdersController < Public::Base
  before_action :set_order, only: [:show, :edit]

  def index
    @orders = Order.where(user_id: current_user.id).page(params[:page]).per(10).reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_path, notice: 'カートは空です。'
      return
    elsif user_signed_in? && Address.find_by(user_id: current_user).present?
      redirect_to new_for_users_orders_path
    else
      @order = Order.new
    end
  end

  def new_for_users
     @cart = current_cart
     @address = Address.find_by(user_id: current_user)
     @order = Order.new
  end

  def confirm
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_items(current_cart)
    render :new if @order.invalid? || params[:back]
  end

  def edit
  end

  def create
      @order = Order.new(order_params)
      @order.add_items(current_cart)
      if params[:back]
         @cart = current_cart
         render :new
      elsif
        @order.line_items.each do |item|
          if item.work.stock - item.quantity < 0.0
             return redirect_to cart_path(session[:cart_id]),flash: {notice: '大変申し訳ございません。売り切れの商品がございます。'}
          end
          item.work.update!(stock: item.work.stock - item.quantity)
        end
         @order.save
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
