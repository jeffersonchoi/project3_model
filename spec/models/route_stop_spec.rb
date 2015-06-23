require 'rails_helper'

RSpec.describe RouteStop, type: :model do
    it "is invalid without a route_id" do
      	route_stop = RouteStop.new(route_id: nil, stop_id: 5, order: 5)
      	expect(route_stop).to be_invalid
  	end

  	it "route_id is an integer" do
  		route_stop1 = RouteStop.new(route_id: "Andrew", stop_id: 5, order: 5)
  		route_stop2 = RouteStop.new(route_id: 5, stop_id: 5, order: 5)
  		expect(route_stop1).to be_invalid
  		expect(route_stop2).to be_valid
  	end

    it "is invalid without a stop_id" do
    	route_stop = RouteStop.new(route_id: 5, stop_id: nil, order: 5)
      	expect(route_stop).to be_invalid
  	end

  	it "stop_id is an integer" do
  		route_stop1 = RouteStop.new(route_id: 5, stop_id: "Andrew", order: 5)
  		route_stop2 = RouteStop.new(route_id: 5, stop_id: 5, order: 5)
  		expect(route_stop1).to be_invalid
  		expect(route_stop2).to be_valid
  	end

  	it "is invalid without an order" do
  		route_stop = RouteStop.new(route_id: 5, stop_id: 5, order: nil)
      	expect(route_stop).to be_invalid
  	end

  	it "order is an integer" do
  		route_stop1 = RouteStop.new(route_id: 5, stop_id: 5, order: "Andrew")
  		route_stop2 = RouteStop.new(route_id: 5, stop_id: 5, order: 5)
  		expect(route_stop1).to be_invalid
  		expect(route_stop2).to be_valid
  	end
  	
end


# t.integer  "route_id"
#     t.integer  "stop_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer  "order"