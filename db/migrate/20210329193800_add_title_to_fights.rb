class AddTitleToFights < ActiveRecord::Migration[6.1]
  def change
    add_column :fights, :title, :string
  end
end
