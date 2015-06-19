class Bus < ActiveRecord::Base
  belongs_to :route
  has_many :route_stops, through: :routes
  has_many :stops, through: :stop_times
  has_many :stops, through: :stop_times
end
