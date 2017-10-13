class HomeController < ApplicationController
def index
	@products = Product.all
	
	if session[:order_id].present?
		@current_order = Order.find(session[:order_id])
	else
	end
	
end

def show
	@product = Product.find(params[:id])
	@category = @product.category
	@subcategory = @product.subcategory
	
end

end
