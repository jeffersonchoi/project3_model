class Bus < ActiveRecord::Base
  belongs_to :route
  has_many :route_stops, through: :route
  has_many :stop_times
  has_many :stops, through: :stop_times


  def self.getBuses
    response = HTTParty.get("http://api.metro.net/agencies/%20lametro/routes/704/vehicles/")
  end




end
