class PrivateSiteMailer < ActionMailer::Base

	def private_site_email(private_site)
		@private_site = private_site
		@domain = "localhost:3000"
		if Rails.env =="staging"
			@domain = "http://1501_252e57_condos_full.softgravity.com:8081"
		elsif  Rails.env =="production"
			@domain = "http://www.252e57.com"
		end
		mail(to: private_site.receiver_email,from: @private_site.user.email ,subject: "252 East Fifty Seven Private Website", cc: private_site.email_cc, bcc: private_site.email_bcc)
	end
end
