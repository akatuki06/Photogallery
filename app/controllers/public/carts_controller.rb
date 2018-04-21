class Public::CartsController < Public::Base
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
