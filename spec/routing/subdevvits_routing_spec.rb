require "rails_helper"

RSpec.describe SubdevvitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/subdevvits").to route_to("subdevvits#index")
    end

    it "routes to #new" do
      expect(get: "/subdevvits/new").to route_to("subdevvits#new")
    end

    it "routes to #show" do
      expect(get: "/subdevvits/1").to route_to("subdevvits#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/subdevvits/1/edit").to route_to("subdevvits#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/subdevvits").to route_to("subdevvits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/subdevvits/1").to route_to("subdevvits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/subdevvits/1").to route_to("subdevvits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/subdevvits/1").to route_to("subdevvits#destroy", id: "1")
    end
  end
end
