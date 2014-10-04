class Gallery < ActiveRecord::Base

	include ChangeLogExt

	has_attached_file :thumbnail
	validates :title, presence: true
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage/
	# Validate filename
	validates_attachment_file_name :thumbnail, :matches => [/png\Z/, /jpe?g\Z/]

	scope :content, -> { where(update_section: false, detail_section: false) }
	scope :updates, -> { where(update_section: true) }
	scope :details, -> { where(detail_section: true) }
	scope :brokers, -> { where(private_available: true) }
	scope :pub_availible, -> { where(public_available: true) }
	scope :neighborhood, -> { where(neighborhood_ava: true) }
	attr_accessible :title, :thumbnail, :private_available, :published_date, :heading

	has_many :gallery_images, dependent: :destroy
	accepts_nested_attributes_for :gallery_images

end
