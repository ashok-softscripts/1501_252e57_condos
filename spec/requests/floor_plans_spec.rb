require 'rails_helper'

RSpec.describe "FloorPlans", :type => :request do
  describe "GET /floor_plans" do
    it "works! (now write some real specs)" do
      get floor_plans_path
      expect(response.status).to be(200)
    end
  end
end
