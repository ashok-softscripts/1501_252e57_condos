Rails.application.config.middleware.use ExceptionNotification::Rack,
	:email => {
		:email_prefix => "[CO-OP 252] [#{Rails.env}] - ",
		:sender_address => %w{application.errors@softgravity.com},
		:exception_recipients => %w{application.errors@softgravity.com}
	}
