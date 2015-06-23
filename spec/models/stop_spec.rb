require 'rails_helper'

RSpec.describe Stop, type: :model do
  it "is invalid without a latitude" do

      stop = Stop.new(name: "Jefferson's Stop", latitude: nil, longitude: 145.33, api_id: 1)
      expect(stop).to be_invalid

  end

end
