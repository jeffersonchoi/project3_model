class AddSecToStop < ActiveRecord::Migration
  def change
    add_column :stops, :seconds, :string
  end
end
