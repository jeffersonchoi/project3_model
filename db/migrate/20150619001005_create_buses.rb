class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.belongs_to :route, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
