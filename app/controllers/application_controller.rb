class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	before_filter :set_change_log_whodidit

	def after_sign_in_path_for(resource)
		admin_dashboard_path
	end

	def check_for_mobile
		session[:mobile_override] = params[:mobile] if params[:mobile]
		prepare_for_mobile if mobile_device?
	end

	def prepare_for_mobile
		prepend_view_path Rails.root + 'app' + 'views_mobile'
	end

	def mobile_device?
		if session[:mobile_override]
			session[:mobile_override] == "1"
		else
			# Season this regexp to taste. I prefer to treat iPad as non-mobile.
			(request.user_agent =~ /(iPhone|iPod|Android|webOS|Mobile)/)
		end
	end

	def older_ie?
		(request.user_agent =~ /(MSIE 8|MSIE 7)/)
	end

	def ie6?
		# (request.user_agent =~ /(MSIE 6)/)
		false
	end

	# starting from 5 to 30 for firefox please not it will think that 3 and 4 and 2 are fine hopefully there is noone that uses those anymore so noone will notice
	# also 5x will be thought of as old browsers
	def old_ff?
		(request.user_agent =~ /Firefox\/([0-2][0-9])|Firefox\/([5-9])/) || (request.user_agent =~ /(MSIE 6)/) || (request.user_agent =~ /Chrome\/([0-2][0-9])/)
	end

	helper_method :mobile_device?
	helper_method :older_ie?
	helper_method :old_ff?

	protected

	# Returns the user who is responsible for any changes that occur.
	# By default this calls `current_user` and returns the result.
	#
	# Override this method in your controller to call a different
	# method, e.g. `current_login_user`, or anything.
	def user_for_change_log
		current_user.email rescue nil
	end


	private

	# Tells ChangeLog who is responsible for any changes.
	def set_change_log_whodidit
		::ChangeLog.whodidit = user_for_change_log
	end

end
