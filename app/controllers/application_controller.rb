class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	# def after_sign_in_path_for(resource)
	# 	if resource.sign_in_count == 1
	# 	   redirect_to profiles_path
	# 	else
	# 	   root_path
	# 	end
	# end

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :email, :password, :password_confirmation])
  end
end
