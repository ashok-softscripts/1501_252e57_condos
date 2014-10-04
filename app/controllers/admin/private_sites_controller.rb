class Admin::PrivateSitesController < ApplicationController
	layout "admin"
  before_action :set_private_site, only: [:destroy, :edit, :update, :send_email]


  # GET /articles/new
  def new
    @private_site = PrivateSite.new
		@private_site.ps_email = t("private_site.email")
		@private_site.welcome_msg = t("private_site.welcome")
		@private_site.welcome_signiture = t("private_site.welcome_sig")
  end


	def update
		create
	end
  # POST /articles
  # POST /articles.json
  def create
		@private_site = PrivateSite.new(private_site_params)
		@private_site.user = current_user
    respond_to do |format|
      if @private_site.save
				params[:private_site][:floor_plans].reject! { |c| c.empty? }.each do |floor_plan|
					@private_site.floor_plans << FloorPlan.find(floor_plan)
				end
				params[:private_site][:galleries].reject! { |c| c.empty? }.each do |gallery|
					@private_site.galleries << Gallery.find(gallery)
				end
				params[:private_site][:private_videos].reject! { |c| c.empty? }.each do |p_video|
					@private_site.private_videos << PrivateVideo.find(p_video)
				end

				params[:private_site][:si_details].reject! { |c| c.empty? }.each do |update|
					update_parsed = update.split("-")
					si = SiteItem.new
					si.private_site = @private_site
					si.si_detail = true
					if update_parsed[0] == "g"
						si.si_item = Gallery.find(update_parsed[1])
					elsif update_parsed[0] == "p"
						si.si_item =  Article.find(update_parsed[1])
					end
					si.save
				end
				params[:private_site][:si_updates].reject! { |c| c.empty? }.each do |update|
					update_parsed = update.split("-")
					si = SiteItem.new
					si.private_site = @private_site
					si.si_update = true
					if update_parsed[0] == "g"
						si.si_item = Gallery.find(update_parsed[1])
					elsif update_parsed[0] == "v"
						si.si_item = PrivateVideo.find(update_parsed[1])
					elsif update_parsed[0] == "p"
						si.si_item =  Article.find(update_parsed[1])
					end
					si.save
				end

        format.html { redirect_to admin_private_sites_dashboard_path, notice: 'Site was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
		@private_site.destroy
    respond_to do |format|
      format.html { redirect_to admin_private_sites_dashboard_path }
    end
	end


	def send_email
		@private_site.ps_send = Date.today
		PrivateSiteMailer.private_site_email(@private_site).deliver
		@private_site.save
		redirect_to admin_private_sites_dashboard_path, notice: 'Email was successfully send.'
	end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_private_site
			@private_site = PrivateSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_site_params
      params.require(:private_site).permit(:receiver_email, :email_cc, :email_bcc, :ps_email, :receiver_name, :welcome_msg, :welcome_signiture)
    end
end
