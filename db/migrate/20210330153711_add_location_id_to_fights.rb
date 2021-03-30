class AddLocationIdToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :location_id, :integer
  end
end
