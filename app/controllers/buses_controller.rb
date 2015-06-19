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


  #function to get bus directoin
  def show
    @buses = Bus.getBuses["items"][0]["run_id"].split("_").last
    if @buses == "0"
      @direction = "EastBound"
    elsif @buses == "1"
      @direction = "WestBound"
    else
      @direction = "none"
    end

    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @direction
      }
    end


  end


end
