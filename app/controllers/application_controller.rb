class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
	  def current_cart

	  	Cart.find(session[:cart_id])

	  rescue ActiveRecord::RecordNotFound
	  	cart = Cart.create
	  	session[:cart_id] = cart.id
	  	cart
	  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
