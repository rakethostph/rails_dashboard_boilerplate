class ApplicationController < ActionController::Base

	# before_action :check_if_profile_is_not_empty

	# def check_if_profile_is_not_empty
	# 	if current_user.profile.first_name.present? && current_user.profile.last_name.present?
	# 		redirect_to authenticated_root_path
	# 	else
	# 		redirect_to edit_profile_path(current_user.profile)
	# 	end
	# end

end
