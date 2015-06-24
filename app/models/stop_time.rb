class StopTime < ActiveRecord::Base
  belongs_to :bus
  belongs_to :route_stop
  has_one :route, through: :route_stop
  has_one :stop, through: :route_stop

  validates :bus_id, :route_stop_id, :estimated_stop_time, presence: true

end
