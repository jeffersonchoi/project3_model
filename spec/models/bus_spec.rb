require 'rails_helper'

RSpec.describe Bus, type: :model do
  it "is invalid without a latitude" do
  	bus = Bus.new(name: "Paul's Bus", latitude: nil, longitude: 45.23)
  		expect(bus).to be_invalid
  	end

  	it "is invalid without a longitude" do
  		bus = Bus.new(name: "Paul's Bus", latitude: 48.52, longitude: nil)
  			expect(bus).to be_invalid
  	end	

  	it "is invalid without a route_id" do 
  		bus = Bus.new(name: "Paul's Bus", latitude: 48.52, longitude: 45.23, route_id: nil)
  			expect(bus).to be_invalid
  		end

  	it "is invalid without am api_id" do
  		bus = Bus.new(name: "Paul's Bus", latitude: 48.52, longitude: 45.23, route_id: 1, api_id: nil)
  			expect(bus).to be_invalid
  		end	
end	

