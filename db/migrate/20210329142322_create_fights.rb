class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.integer :challenger_id
      t.integer :defender_id

      t.timestamps
    end
  end
end
