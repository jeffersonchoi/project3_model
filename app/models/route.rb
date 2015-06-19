class Route < ActiveRecord::Base
  has_many :buses
  has_many :route_stops
  has_many :stops, through: :route_stops
end
