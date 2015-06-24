class Stop < ActiveRecord::Base
  has_many :route_stops
  has_many :routes, through: :route_stops
  has_many :stop_times, through: :route_stops
  has_many :buses, through: :stop_times

  validates :latitude, :longitude , presence: true, numericality: { only_float: true }
  validates :api_id, presence: true, numericality: { only_integer: true }
end
