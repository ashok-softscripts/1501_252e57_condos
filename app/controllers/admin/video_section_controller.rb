class Admin::VideoSectionController < ApplicationController
	layout "admin"
	before_filter :set_nav
	before_action :set_video_section, only: [:show, :edit, :update, :destroy]


	# GET /video_sections/1/edit
	def edit
	end

	# PATCH/PUT /video_sections/1
	# PATCH/PUT /video_sections/1.json
	def update
		respond_to do |format|
			if @video_section.update(video_section_params)
				format.html { redirect_to admin_content_path, notice: 'VideoSection was successfully updated.' }
			else
				format.html { render action: 'edit' }
			end
		end
	end

	# DELETE /video_sections/1
	# DELETE /video_sections/1.json
	def destroy
		@video_section.destroy
		respond_to do |format|
			format.html { redirect_to admin_content_path }
		end
	end

	private

	def set_nav
		@nav = :contents
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_video_section
		@video_section = VideoSection.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def video_section_params
		params.require(:video_section).permit(:title, :section, :body)
	end
end
