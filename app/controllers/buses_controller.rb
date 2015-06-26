class BusesController < ApplicationController

  def index
    @buses = Bus.all

    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @buses
      }
    end
  end
end
