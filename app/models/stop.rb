class Stop < ActiveRecord::Base
  has_many :route_stops
  has_many :routes, through: :route_stops
  has_many :stop_times, through: :route_stops
  has_many :buses, through: :stop_times



  def self.getStops
    response = HTTParty.get("http://api.metro.net/agencies/lametro/routes/704/stops/")

  end





end
