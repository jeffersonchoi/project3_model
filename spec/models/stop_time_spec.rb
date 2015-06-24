require 'rails_helper'

RSpec.describe StopTime, type: :model do

    it "is invalid without a bus_id" do
        stoptime = StopTime.new(bus_id: nil, route_stop_id: 7, estimated_stop_time: 1234)
        expect(stoptime).to be_invalid
    end

    it "is invalid without a route_stop_id" do
        stoptime = StopTime.new(bus_id: 7, route_stop_id: nil, estimated_stop_time: 1234)
        expect(stoptime).to be_invalid
    end

    it "is invalid without an estimated_stop_time" do
        stoptime = StopTime.new(bus_id: 7, route_stop_id: 7, estimated_stop_time: nil)
        expect(stoptime).to be_invalid
    end

    it "is invalid if the bus_id is not an integer" do
        stoptime = StopTime.new(bus_id: "Jefferson", route_stop_id: 7, estimated_stop_time: 7)
        expect(stoptime).to be_invalid

    end

    it "is invalid if the route_stop_id is not an integer"

    it "is invalid if the estimated_stop_time is not a datetime"



end
