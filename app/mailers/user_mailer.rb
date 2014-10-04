class UserMailer < ActionMailer::Base
	default from: "INFO@252E57.COM"

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: "Thank you for your interest in 252", bcc: "info@252e57.com")
	end

end
