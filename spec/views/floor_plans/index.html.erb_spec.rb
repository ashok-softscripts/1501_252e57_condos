require 'rails_helper'

RSpec.describe "floor_plans/index", :type => :view do
  before(:each) do
    assign(:floor_plans, [
      FloorPlan.create!(
        :residence => "Residence",
        :price => 1.5,
        :bedrooms => 1,
        :bathrooms => 1.5,
        :additions => "Additions",
        :sq_ft => 1.5,
        :sq_m => 1.5,
        :common_charges => 1.5,
        :monthly_total => 1.5,
        :pilot => "Pilot",
        :avalible_general => false,
        :avaliable_admins => false
      ),
      FloorPlan.create!(
        :residence => "Residence",
        :price => 1.5,
        :bedrooms => 1,
        :bathrooms => 1.5,
        :additions => "Additions",
        :sq_ft => 1.5,
        :sq_m => 1.5,
        :common_charges => 1.5,
        :monthly_total => 1.5,
        :pilot => "Pilot",
        :avalible_general => false,
        :avaliable_admins => false
      )
    ])
  end

  it "renders a list of floor_plans" do
    render
    assert_select "tr>td", :text => "Residence".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Additions".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Pilot".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
