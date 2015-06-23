class Bus < ActiveRecord::Base
  belongs_to :route
  has_many :route_stops, through: :route
  has_many :stop_times
  has_many :stops, through: :stop_times

  validates :latitude, :longitude , presence: true, numericality: { only_float: true }
 

end
