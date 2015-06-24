class ChangeOrderType < ActiveRecord::Migration
  def change
  	remove_column :route_stops, :order
  	add_column :route_stops, :order, :integer 
  end
end
