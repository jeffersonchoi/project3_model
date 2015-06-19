class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|

      t.timestamps null: false
    end
  end
end
