class Admin::SalesController < Admin::Base
  before_action :authenticate_admin!

  def index
  	@orders = Order.all
  	@search = Order.ransack(params[:q])
  	@orders = @search.result
  end
end
