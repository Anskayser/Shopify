class Admin::SubcategoriesController < ApplicationController


def index
	@subcategories = Subcategory.all
end

def show
@admin_subcategory = Subcategory.find(params[:id])
	
end

def new
	@admin_subcategory = Subcategory.new
end

def edit
	@admin_subcategory = Subcategory.find(params[:id])

end

def create
 	@admin_subcategory = Subcategory.new(secure_params)
	if @admin_subcategory.save 
		redirect_to admin_subcategories_path
	else
		render 'new'
end
end

def update
		@admin_subcategory = Subcategory.find(params[:id])
		if @admin_subcategory.update(secure_params)
			redirect_to admin_subcategories_path
		else
			render 'edit'
		end
end

def destroy
	@admin_subcategory = Subcategory.find(params[:id])
	@admin_subcategory.destroy
	redirect_to admin_root_path	
end
	 private
	 	def secure_params
	 		
	 	    	params.require(:subcategory).permit(:name, :category_id)

		end
end


