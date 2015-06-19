class BusesController < ApplicationController

  def index
    @buses = Bus.getBuses["items"]

    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @buses
      }
    end

    @buses.each do |bus|

      Bus.create(latitude: bus["latitude"], name: bus["id"],
          longitude: bus["longitude"])

  end
  end

end
