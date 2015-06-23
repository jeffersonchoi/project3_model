class RouteStop < ActiveRecord::Base
  belongs_to :route
  belongs_to :stop
  has_many :stop_times

  validates :route_id, presence: true, numericality: { only_integer: true }
  validates :stop_id, presence: true, numericality: { only_integer: true }
  validates :order, presence: true, numericality: { only_integer: true }
end


