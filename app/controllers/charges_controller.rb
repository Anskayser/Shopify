class ChargesController < ApplicationController

 rescue_from Stripe::CardError, with: :catch_exception
	def new
	@order = Order.find(session[:order_id])
	@Items_price = @order.products.map(&:price).sum
	
	end


	def create
	
	@order = Order.find(session[:order_id])
	@Items_price = @order.products.map(&:price).sum
  	Card.new(charges_params, current_user).call(@Items_price)
    redirect_to new_charge_path
	end
	private

  	def charges_params
    	params.permit(:stripeEmail, :stripeToken, :order_id)
  	end

  def catch_exception(exception)
    flash[:error] = exception.message
	end
end
