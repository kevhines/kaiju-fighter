class AddHealthToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :health, :integer, :default => 100
  end
end
