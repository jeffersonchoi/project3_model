class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
