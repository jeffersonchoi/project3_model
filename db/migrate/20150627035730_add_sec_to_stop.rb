class AddSecToStop < ActiveRecord::Migration
  def change
    add_column :stops, :seconds, :integer
  end
end
