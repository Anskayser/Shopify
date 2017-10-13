class WelcomeController < ApplicationController
	def index
		if current_user.present?
			if current_user.has_role? :user
			 	redirect_to home_index_path , notice:'User Signed In'
			 else
			 	redirect_to admin_root_path
			end
		else
			redirect_to new_user_session_path , notice: 'I am logged out '
		end
	end 
end
