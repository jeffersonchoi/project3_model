class CreateStopTimes < ActiveRecord::Migration
  def change
    create_table :stop_times do |t|
      t.belongs_to :bus, index: true, foreign_key: true
      t.belongs_to :route_stop, index: true, foreign_key: true
      t.datetime :estimated_stop_time

      t.timestamps null: false
    end
  end
end
