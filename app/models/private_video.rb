class PrivateVideo < ActiveRecord::Base
	include ChangeLogExt

	has_attached_file :thumbnail
	validates :title, presence: true
	validates :url, presence: true

	validates_attachment_content_type :thumbnail, :content_type => /\Aimage/
	# Validate filename
	validates_attachment_file_name :thumbnail, :matches => [/png\Z/, /jpe?g\Z/]

	scope :content, -> {where(update_section: false)}
	scope :updates, -> {where(update_section: true)}

	attr_accessible :title, :url, :thumbnail, :published_date, :heading


	def get_vimeo_thumbnail_url
		url = self.url
		# extract the video id
		vimeo_video_id = url.scan(/\d+/)[0]
		# API call
		vimeo_video_json_url = "http://vimeo.com/api/v2/video/#{vimeo_video_id}.json"
		# Parse the JSON and extract the thumbnail_large url
		thumbnail_image_location = JSON.parse(open(vimeo_video_json_url).read).first['thumbnail_large'] rescue nil
		return  thumbnail_image_location
	end
end
