class Admin::CategoriesController < ApplicationController


def index
	
	@categories = Category.all
end

def show

	@admin_category = Category.find(params[:id])
end

def new
	@admin_category = Category.new
end

def edit
  @admin_category = Category.find(params[:id])	
end

def create
@admin_category = Category.new(secure_params)
		if @admin_category.save
			redirect_to admin_categories_path
		else
			render 'new'
		end
end

def update

@admin_category = Category.find(params[:id])
	if @admin_category.update(secure_params)
		redirect_to admin_categories_path
	else
		render 'edit'
	end	
end

def destroy
	@admin_category = Category.find(params[:id])
	@admin_category.destroy
	
	redirect_to admin_root_path
	
end

	 private
	 	def secure_params
	 		
	 	    	params.require(:category).permit(:name)

			end
end
