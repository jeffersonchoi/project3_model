class CreateRouteStops < ActiveRecord::Migration
  def change
    create_table :route_stops do |t|
      t.belongs_to :route, index: true, foreign_key: true
      t.belongs_to :stop, index: true, foreign_key: true
      t.string :order

      t.timestamps null: false
    end
  end
end
