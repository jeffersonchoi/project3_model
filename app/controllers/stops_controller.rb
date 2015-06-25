class StopsController < ApplicationController
  def index

    @stops = RouteStop
      .includes(:route)
      .includes(:stop)
      .order('"order"')

    respond_to do |format|
      format.html {
        render
      }
      format.json { render :json => @stops.to_json(include: [:route, :stop]) }

    end

  end


  def show
    @first_stop = Stop.find(params[:id])
    @first_stop_name = @first_stop.name
    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render json: @first_stop_name
      }
    end
  end







end
