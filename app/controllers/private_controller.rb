class PrivateController < ApplicationController
	layout "private"
	before_action :set_private_site, only: [:show]
	def show
		if older_ie? || ie6?
			render :show, layout: "not_supported"
			return false
		end
	end
	private
	def set_private_site
		private_sites = PrivateSite.where("uniq_ident = ?", params[:uniq_id])
		if private_sites.empty?
			redirect_to root_path
			return false
		else
			@private_site = private_sites.first
		end
	end
end
