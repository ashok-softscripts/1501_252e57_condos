class Admin::FloorPlansController < ApplicationController
  layout "admin"
  before_action :set_floor_plan, only: [:show, :edit, :update, :destroy, :download]
  before_filter :set_nav
  # GET /floor_plans
  # GET /floor_plans.json


  def index
    if current_user.nil?
      @floor_plans = FloorPlan.general
    elsif current_user.kind_of?(Broker)
      @floor_plans = FloorPlan.brokers
    else
      @floor_plans = FloorPlan.all
    end
    respond_to do |format|
      format.pdf do
        render :pdf => "availability",
        :orientation => 'Landscape',
        :disposition  => 'attachment'
      end
    end
  end

  # GET /floor_plans/1
  # GET /floor_plans/1.json
  def show
  end

  # GET /floor_plans/new
  def new
    @floor_plan = FloorPlan.new
  end

  # GET /floor_plans/1/edit
  def edit
  end

  # POST /floor_plans
  # POST /floor_plans.json
  def create
    @floor_plan = FloorPlan.new(floor_plan_params)

    respond_to do |format|
      if @floor_plan.save
        format.html { redirect_to admin_availability_path, notice: 'Floor plan was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /floor_plans/1
  # PATCH/PUT /floor_plans/1.json
  def update
    respond_to do |format|
      if @floor_plan.update(floor_plan_params)
        format.html { redirect_to admin_availability_path, notice: 'Floor plan was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /floor_plans/1
  # DELETE /floor_plans/1.json
  def destroy
    @floor_plan.destroy
    respond_to do |format|
      format.html { redirect_to admin_availability_path }
    end
  end

  def download_index_pdf
    @floor_plans = FloorPlan.all

  end

  def download
    response.headers['Content-Type'] = @floor_plan.plan_content_type
    response.headers['Content-Disposition'] = 'attachment; filename=' + @floor_plan.plan_file_name
    send_file @floor_plan.plan.path
  end
  private
    def set_nav
      @nav = :availability
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_floor_plan
      @floor_plan = FloorPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floor_plan_params
      params.require(:floor_plan).permit(:residence, :price, :bedrooms, :bathrooms, :indoor_sq_ft, :indoor_sq_m, :outdoor_sq_ft, :outdoor_sq_m, :common_charges, :monthly_total, :pilot, :avaliable_general, :avaliable_admins, :plan, :additions => [])
    end
end
