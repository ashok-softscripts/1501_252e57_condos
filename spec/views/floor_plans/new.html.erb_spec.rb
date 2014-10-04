require 'rails_helper'

RSpec.describe "floor_plans/new", :type => :view do
  before(:each) do
    assign(:floor_plan, FloorPlan.new(
      :residence => "MyString",
      :price => 1.5,
      :bedrooms => 1,
      :bathrooms => 1.5,
      :additions => "MyString",
      :sq_ft => 1.5,
      :sq_m => 1.5,
      :common_charges => 1.5,
      :monthly_total => 1.5,
      :pilot => "MyString",
      :avalible_general => false,
      :avaliable_admins => false
    ))
  end

  it "renders new floor_plan form" do
    render

    assert_select "form[action=?][method=?]", floor_plans_path, "post" do

      assert_select "input#floor_plan_residence[name=?]", "floor_plan[residence]"

      assert_select "input#floor_plan_price[name=?]", "floor_plan[price]"

      assert_select "input#floor_plan_bedrooms[name=?]", "floor_plan[bedrooms]"

      assert_select "input#floor_plan_bathrooms[name=?]", "floor_plan[bathrooms]"

      assert_select "input#floor_plan_additions[name=?]", "floor_plan[additions]"

      assert_select "input#floor_plan_sq_ft[name=?]", "floor_plan[sq_ft]"

      assert_select "input#floor_plan_sq_m[name=?]", "floor_plan[sq_m]"

      assert_select "input#floor_plan_common_charges[name=?]", "floor_plan[common_charges]"

      assert_select "input#floor_plan_monthly_total[name=?]", "floor_plan[monthly_total]"

      assert_select "input#floor_plan_pilot[name=?]", "floor_plan[pilot]"

      assert_select "input#floor_plan_avalible_general[name=?]", "floor_plan[avalible_general]"

      assert_select "input#floor_plan_avaliable_admins[name=?]", "floor_plan[avaliable_admins]"
    end
  end
end
