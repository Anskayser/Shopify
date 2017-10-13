class OrdersController < ApplicationController

 	 def index

	 
	@order = Order.all

	# THIS IS FOR CART DISPLAY 
  	end

  	def create
  	end

  	def show
			# @Order_products = Product.find(params[:id])

	end

	def totalAmount
		
	@order = Order.find(params[:id])
	@Items_price = @order.products.map(&:price).sum
	end

	def showcart

		@order = Order.find(params[:id])
	end

  def cart
	   	@product = Product.find(params[:id])
  	unless session[:order_id].present?	
	  	@order = Order.new()
		@order.user_id = current_user.id
		@order.status  = 'incomplete'  	
	  	@order.save
	  	@order_products = @order.order_products.new()
	  	# check here 
	  	@order_products.product_id = @product.id
	  	@order_products.save
	    session[:order_id] = @order.id
	else
		@order = Order.find(session[:order_id])
		@order_products = @order.order_products.new()
	  	@order_products.product_id = @product.id
	  	@order_products.save
	end

 	 # @product = Product.find(params[:id])
 	# @name    =  @product.name
 	# @price   =  @product.price

 	

  	
  end

  def update
 

  end

  def destroy
  	
			@order_products = OrderProduct.find(params[:id])

		 	@order_products.destroy

			redirect_to home_index_path
		end

  # private
  # def order_products_params
  #   params.require(:order_item).permit(:quantity, :product_id)
  # end
   # private
	 #	def secure_params
	 # 	    	params.require(:orders).permit(:user_id, :status)
		# end
end