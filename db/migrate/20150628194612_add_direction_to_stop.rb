class AddDirectionToStop < ActiveRecord::Migration
  def change
    add_column :stops, :direction, :string
  end
end
