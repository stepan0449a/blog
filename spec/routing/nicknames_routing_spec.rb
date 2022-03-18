require "rails_helper"

RSpec.describe NicknamesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/nicknames").to route_to("nicknames#index")
    end

    it "routes to #new" do
      expect(get: "/nicknames/new").to route_to("nicknames#new")
    end

    it "routes to #show" do
      expect(get: "/nicknames/1").to route_to("nicknames#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/nicknames/1/edit").to route_to("nicknames#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/nicknames").to route_to("nicknames#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/nicknames/1").to route_to("nicknames#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/nicknames/1").to route_to("nicknames#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/nicknames/1").to route_to("nicknames#destroy", id: "1")
    end
  end
end
