class PublicController < ApplicationController
	before_filter :check_for_mobile, :only => [:index]
	# before_filter :prepare_for_mobile, :only => :index
	helper_method :place_holder

	def index
		@design = VideoSection.all
		@pres = Article.all
		@plans = FloorPlan.general
		@user = PublicUser.new
		if mobile_device?
			render :index, layout: "mobile"
			return false
		end
		if ie6?
			render :index, layout: "ie6"
			return false
		end
		if old_ff?
			render :index, layout: "not_supported"
			return false
		end
	end

	def gallery
		@design = VideoSection.all
		@pres = Article.all
		@plans = FloorPlan.general
		@user = PublicUser.new
		if mobile_device?
			render :gallery, layout: "mobile"
			return false
		end
		if ie6?
			render :gallery, layout: "ie6"
			return false
		end
		if old_ff?
			render :gallery, layout: "not_supported"
			return false
		end
	end

	def floor_plans
		@floor_plans = FloorPlan.general
		respond_to do |format|
			format.pdf do
				render :pdf => "availability",
							 :orientation => 'Landscape',
							 :disposition  => 'attachment'

			end
		end
	end
	def create
		@user = PublicUser.new(params[:public_user])
		if @user.save
			UserMailer.welcome_email(@user).deliver
			render json: {"success" => true}
		else
			render json: @user.errors.messages
		end
	end

	def place_holder(attribute, options={})
		if !@user.errors.messages[attribute.to_sym].empty? && @user.errors.any?
			return @user.errors.messages[attribute.to_sym][0]
		else
			return t('activerecord.attributes.user.'+attribute)
		end
	end
end
