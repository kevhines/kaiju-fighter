class AddHealthToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :health, :integer, :default => 100
  end
end
