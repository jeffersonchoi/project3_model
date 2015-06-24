require 'rails_helper'

RSpec.describe Stop, type: :model do

    it "is invalid without a latitude" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: nil, longitude: 145.33, api_id: 1)
        expect(stop).to be_invalid

    end

    it "is invalid without a longitude" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: 36.7, longitude: nil, api_id: 1)
        expect(stop).to be_invalid

    end

    it "is invalid without api_id" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: 36.7, longitude: 145.33, api_id: nil)
        expect(stop).to be_invalid

    end

    it "is invalid if latitude is not a float" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: "Jefferson", longitude: 145.33, api_id: 7)
        expect(stop).to be_invalid

    end

    it "is invalid if longtitude is not a float" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: 36.7 , longitude: "Jefferson", api_id: 7)
        expect(stop).to be_invalid

    end

    it "is invalid if api_id is not a integer" do

        stop = Stop.new(name: "Jefferson's Stop", latitude: 36.7 , longitude: 145.33, api_id: "Jefferson")
        expect(stop).to be_invalid

    end


end
