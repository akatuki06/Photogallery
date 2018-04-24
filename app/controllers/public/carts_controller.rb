class Public::CartsController < Public::Base
  before_action :set_cart

  def show
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path, notice: 'カートが空になりました。'
  end

  private
    def set_cart
      if current_cart.blank?
        redirect_to root_path, notice: 'カートは空です'
      elsif
        params[:id].to_i != session[:cart_id]
        redirect_to root_path, notice: '権限がありません'
      else
        @cart = Cart.find(params[:id])
      end
    end

end
