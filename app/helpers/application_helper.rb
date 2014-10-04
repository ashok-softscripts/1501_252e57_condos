module ApplicationHelper
	def is_admin?
		current_user && current_user.kind_of?(Admin)
	end
end
