require "rails_helper"

RSpec.describe FloorPlansController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/floor_plans").to route_to("floor_plans#index")
    end

    it "routes to #new" do
      expect(:get => "/floor_plans/new").to route_to("floor_plans#new")
    end

    it "routes to #show" do
      expect(:get => "/floor_plans/1").to route_to("floor_plans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/floor_plans/1/edit").to route_to("floor_plans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/floor_plans").to route_to("floor_plans#create")
    end

    it "routes to #update" do
      expect(:put => "/floor_plans/1").to route_to("floor_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/floor_plans/1").to route_to("floor_plans#destroy", :id => "1")
    end

  end
end
