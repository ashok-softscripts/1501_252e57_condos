class PublicUser < ActiveRecord::Base

	attr_accessible :name, :email, :phone, :firstname, :lastname, :country, :size, :comment, :broker

	validates :name, :email, :firstname, :lastname, :presence => true
	validates :phone, :format => { :with =>  /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z|\A\z/i }
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :firstname, :length => { :maximum => 50 }
	validates :lastname, :length => { :maximum => 50 }
	validates :phone, :length => { :maximum => 10 }

	attr_accessor :firstname, :lastname

	before_validation :combine_and_clean_names

	before_validation :check_broker

	before_validation :clean_phone_number

	def self.to_csv(options = {})
		start_at = options.delete(:start_at)
		end_at = options.delete(:end_at)
		CSV.generate({}) do |csv|
			csv << column_names
			where("created_at >= ? AND created_at <= ?", end_at, start_at).each do |user|
				csv << user.attributes.values_at(*column_names)
			end
		end

	end

	private

	def combine_and_clean_names
		self.name = (firstname + lastname)
	end

	def clean_phone_number
		self.phone = self.phone.gsub(/[-. ]/, "")
	end

	def check_broker
		if self.broker == 'true'
			self.broker = true
		elsif self.broker == 'false'
			self.broker = false
		end
	end
end
