class Public::LineItemsController < Public::Base
	 before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
  	@line_items = LineItem.all
  end

  def show
  end

  def new
  	@line_item = LineItem.new
  end

  def create
  	@cart = current_cart
  	work = Work.find(params[:work_id])
    @line_item = @cart.add_work(work.id)
  	# @line_item = @cart.line_items.build(work: work)
    @line_item.price = work.price #品目の単価を渡す
  		if @line_item.save
  			redirect_to cart_path(@cart.id), notice: 'カートに商品が追加されました。'
  		else
  			render :new
  		end
  	end

  def edit
  end

  def update
      if @line_item.update(line_item_params)
        redirect_to @line_item, notice: 'Line item was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @line_item.destroy
      redirect_to cart_path(session[:cart_id]), notice: '商品をカートから削除しました。'
  end

  private

    def set_line_item
    	@line_item = LineItem.find(params[:id])
    end

    def line_item_params
    	params.require(:line_item).permit(:work_id, :cart_id)
    end
end

