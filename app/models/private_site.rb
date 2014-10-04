class PrivateSite < ActiveRecord::Base
	include BCrypt
	include Rails.application.routes.url_helpers

	belongs_to :user
	has_many :site_items


	validates :receiver_email, presence: true
	validates :ps_email, presence: true
	validates :receiver_name, presence: true
	validates :welcome_msg, presence: true

	has_many :floor_plans, :through => :site_items, :source => :si_item, :source_type => 'FloorPlan', dependent: :destroy
	has_many :galleries, ->{  where("`site_items`.`si_update` is NULL AND `site_items`.`si_detail` = ?", false)  }, :through => :site_items, :source => :si_item, :source_type => 'Gallery',  dependent: :destroy
	has_many :private_videos, ->{  where("`site_items`.`si_update` is NULL",)  }, :through => :site_items, :source => :si_item, :source_type => 'PrivateVideo',  dependent: :destroy

	has_many :si_updates, -> { where("si_update = ?", true) }, class: SiteItem
	has_many :si_details, -> { where("si_detail = ?", true) }, class: SiteItem

	scope :by_user, ->(user) { where("user_id = ?", user.id)}
	default_scope { order(id: :desc) }
	attr_accessible :receiver_email, :email_cc, :email_bcc, :ps_email, :receiver_name, :welcome_msg, :welcome_signiture

	after_create :create_uniq_ident
	def private_url
		private_site_path(self.uniq_ident)
	end
	private
	def create_uniq_ident
		self.uniq_ident = BCrypt::Password.create(self.id).gsub!(/[^a-z0-9_\-]/, '')
		self.save
	end
end
