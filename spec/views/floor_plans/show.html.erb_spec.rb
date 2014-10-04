require 'rails_helper'

RSpec.describe "floor_plans/show", :type => :view do
  before(:each) do
    @floor_plan = assign(:floor_plan, FloorPlan.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Residence/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Additions/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Pilot/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
