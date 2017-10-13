class Admin::UsersController < ApplicationController
	
def index
	@users = User.all
	
end


def destroy
	
		@admin_user = User.find(params[:id])

		 @admin_user.destroy

			redirect_to admin_users_path

end


	


	def signout
		if current_user.present?
			sign_out current_user
			redirect_to root_path
		end	
	end

end
	