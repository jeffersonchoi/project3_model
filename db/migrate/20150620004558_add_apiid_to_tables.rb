class AddApiidToTables < ActiveRecord::Migration
  def change
    add_column :buses, :api_id, :integer
    add_column :stops, :api_id, :integer
    add_column :routes, :api_id, :integer
  end
end
