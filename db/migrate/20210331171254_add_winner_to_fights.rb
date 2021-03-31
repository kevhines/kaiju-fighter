class AddWinnerToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :winner, :integer
  end
end
