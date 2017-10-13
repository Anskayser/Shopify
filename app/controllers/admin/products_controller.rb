class Admin::ProductsController < ApplicationController

	def index
	@products = Product.all
	end

	def show
	@admin_product = Product.find(params[:id])

	end

	def new

	@admin_product = Product.new

	end

	def edit
	@admin_product = Product.find(params[:id])
	end

	def create

	@admin_product = Product.new(secure_params)
	if @admin_product.save
	redirect_to admin_products_path
	else
	render 'new'
		end
  	end

	def update
	@admin_product = Product.find(params[:id])
		if @admin_product.update(secure_params)
			redirect_to admin_products_path
		else
			render 'edit'
		end
	end

	def destroy
		
		@admin_product = Product.find(params[:id])

		 @admin_product.destroy

			redirect_to admin_products_path

		
	end

	 private
	 	def secure_params
	 	    	params.require(:product).permit(:name, :price, :category_id ,:subcategory_id , :avatar)
		end

	
end
