class StopsController < ApplicationController
  def index

    @stops = Stop.all
    @buses = Bus.all

    respond_to do |format|
      format.html {
        render
      }
      format.json {
        render :json => {:stops => @stops, :buses => @buses }
        }
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
