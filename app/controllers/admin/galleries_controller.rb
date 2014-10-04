class Admin::GalleriesController < ApplicationController
	layout "admin"
	before_filter :set_nav
  before_action :set_gallery, only: [:show, :edit, :update, :destroy, :sort, :add_image]


  # GET /gallerys/new
  def new
    @gallery = Gallery.new
		@gallery.update_section = true if params[:update]
		@gallery.detail_section = true if params[:detail]
  end

  # GET /gallerys/1/edit
  def edit
		@gallery_image = GalleryImage.new()
  end

  # POST /gallerys
  # POST /gallerys.json
  def create
    @gallery = Gallery.new(gallery_params)
		@gallery.update_section = params[:gallery][:update_section]
		@gallery.detail_section = params[:gallery][:detail_section]
    respond_to do |format|
				if @gallery.save
					format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully created.' }
				else
					format.html { render action: 'new' }
				end
    end
  end

  # PATCH/PUT /gallerys/1
  # PATCH/PUT /gallerys/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to admin_content_path, notice: 'Gallery was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /gallerys/1
  # DELETE /gallerys/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_content_path }
    end
	end

	def add_image
		@gallery_image = GalleryImage.new(gallery_image_params)
		@gallery_image.gallery = @gallery

		respond_to do |format|
			if @gallery_image.save
				format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery Image  was successfully added.' }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	def remove_image
		@gallery_image = GalleryImage.find(params[:gallery_image_id])
		@gallery = @gallery_image.gallery
		@gallery_image.destroy
		respond_to do |format|
			format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery Image  was successfully removed.'}
		end
	end

	def sort
		@gallery.gallery_images.each do |gi|
			sequence = params[:gallery_images].index("gi-" + gi.id.to_s)
			if !sequence.nil?
				gi.update_attribute(:sequence, sequence ) unless gi.sequence == sequence
			end
		end
		render :nothing => true, :status => 200
	end

	def set_public
		@gallery = Gallery.find(params[:gallery_id])
		current_public = Gallery.pub_availible

		if @gallery == current_public.first
			respond_to do |format|
				format.html { redirect_to admin_content_path, notice: 'New Public Gallery was successfully selected.' }
			end
			return
		end

		current_public.each do |ga|
			ga.public_available =false
			ga.save
		end

		@gallery.public_available = true
		@gallery.save

		respond_to do |format|
				format.html { redirect_to admin_content_path, notice: 'New Public Gallery was successfully selected.' }
		end

	end

	def set_neighborhood
		@gallery = Gallery.find(params[:gallery_id])
		current_public = Gallery.neighborhood

		if @gallery == current_public.first
			respond_to do |format|
				format.html { redirect_to admin_content_path, notice: 'New Neighborhood Gallery was successfully selected.' }
			end
			return
		end
		
		current_public.each do |ga|
			ga.neighborhood_ava =false
			ga.save
		end
		@gallery.neighborhood_ava = true
		@gallery.save
		respond_to do |format|
			format.html { redirect_to admin_content_path, notice: 'New Neighborhood Gallery was successfully selected.' }
		end
	end
  private

		def set_nav
			@nav = :contents
		end

    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :thumbnail, :public_available, :private_available, :published_date,:heading, :gallery_images => [])
		end

		def gallery_image_params
			params.require(:gallery_image).permit(:name, :alt_name, :image)
		end
end
