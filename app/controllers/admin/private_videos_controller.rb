class Admin::PrivateVideosController < ApplicationController
	layout "admin"
	before_filter :set_nav
	before_action :set_private_video, only: [:show, :edit, :update, :destroy]


	# GET /private_videos/new
	def new
		@private_video = PrivateVideo.new
		@private_video .update_section = true if params[:update]
	end

	# GET /private_videos/1/edit
	def edit
		# @video = ::OEmbed::Providers::Vimeo.get(@private_video.url)
	end

	# POST /private_videos
	# POST /private_videos.json
	def create
		@private_video = PrivateVideo.new(private_video_params)
		@private_video.update_section = params[:private_video][:update_section]
		respond_to do |format|
			if @private_video.save
				format.html { redirect_to admin_content_path, notice: 'PrivateVideo was successfully created.' }
			else
				format.html { render action: 'new' }
			end
		end
	end

	# PATCH/PUT /private_videos/1
	# PATCH/PUT /private_videos/1.json
	def update
		respond_to do |format|
			if @private_video.update(private_video_params)
				format.html { redirect_to admin_content_path, notice: 'PrivateVideo was successfully updated.' }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	# DELETE /private_videos/1
	# DELETE /private_videos/1.json
	def destroy
		@private_video.destroy
		respond_to do |format|
			format.html { redirect_to admin_content_path }
		end
	end

	private

	def set_nav
		@nav = :contents
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_private_video
		@private_video = PrivateVideo.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def private_video_params
		params.require(:private_video).permit(:title, :url, :thumbnail, :published_date, :heading)
	end
end
