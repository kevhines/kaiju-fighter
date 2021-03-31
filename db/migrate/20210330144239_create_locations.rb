class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :health, default: 100
      t.timestamps
    end
  end
end
