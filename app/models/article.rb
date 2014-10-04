class Article < ActiveRecord::Base
	include ChangeLogExt

	has_attached_file :article
	validates :title, presence: true
	validates :published_date, presence: true
	validates :description, presence: true
	validates :article, presence: true
	# Validate content type
	validates_attachment_content_type :article, :content_type => "application/pdf"
	# Validate filename
	validates_attachment_file_name :article, :matches => [/pdf\Z/]

	scope :content, -> {where(update_section: false, detail_section: false)}
	scope :updates, -> {where(update_section: true)}
	scope :details, -> {where(detail_section: true)}

	attr_accessible :title, :description, :article, :published_date
end
