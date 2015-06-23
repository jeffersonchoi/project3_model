require 'rails_helper'

RSpec.describe Route, type: :model do
  it "is invalid without an api_id" do
      route = Route.new(name: "Andrew's Route", api_id: nil)
      expect(route).to be_invalid
  end

   it "api_id is an integer" do
      route = Route.new(name: "Andrew's Route", api_id: "Andrew")
      expect(route).to be_invalid
  end
end
