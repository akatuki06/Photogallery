class Public::LineItemsController < Public::Base

   def create
  	@cart = current_cart
  	work = Work.find(params[:work_id])
    @line_item = @cart.add_work(work.id)
    @line_item.price = work.price #品目の単価を渡す
    @line_item.quantity = params[:line_item][:quantity] #数量を渡す
  		if @line_item.save
  			redirect_to cart_path(@cart.id), notice: 'カートに商品が追加されました。'
  		else
  			render :new
  		end
  	end

  def update
    @cart = current_cart
    @line_item = @cart.line_items.find(params[:id])
      if @line_item.update(line_item_params)
        redirect_to cart_path(@cart.id), notice: '数量を変更しました。'
      else
        redirect_to root_path
      end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(session[:cart_id]), notice: '商品をカートから削除しました。'
  end

  private

    def line_item_params
    	params.require(:line_item).permit(:work_id, :cart_id, :quantity)
    end
end

