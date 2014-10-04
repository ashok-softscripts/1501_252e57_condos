class GalleryImage < ActiveRecord::Base
	has_attached_file :image

	validates :name, presence: true
	validates_attachment_content_type :image, :content_type => /\Aimage/
	# Validate filename
	validates :image, presence: true
	validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

	attr_accessible :name, :alt_name, :sequence, :gallery_id, :image

	belongs_to :gallery
	default_scope -> {order('sequence ASC')}
	before_create :set_sequence
	after_destroy :update_sequence
	private
	def set_sequence
		self.sequence = self.class.where(gallery_id: self.gallery_id).count
	end

	def update_sequence
		#get all images
		images = self.gallery.gallery_images
		images.each_with_index do |image, index|
			if !image.destroyed?
				image.sequence = index
				image.save
			end
		end
	end
end
