class Admin::HomeController < AdminController
	def index
		unless current_user.present? and current_user.has_role? :admin
			sign_out current_user
			redirect_to root_path
		end
	end
end
