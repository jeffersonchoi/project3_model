class Route < ActiveRecord::Base
  has_many :buses
  has_many :route_stops
  has_many :stops, through: :route_stops

  validates :api_id, presence: true, numericality: { only_integer: true }
end
