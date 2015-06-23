class Stop < ActiveRecord::Base
  has_many :route_stops
  has_many :routes, through: :route_stops
  has_many :stop_times, through: :route_stops
  has_many :buses, through: :stop_times







end
