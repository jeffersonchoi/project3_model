class StopsController < ApplicationController
  def index
    @stops = Metro.getStops
  end
end
