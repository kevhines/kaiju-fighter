class AddSizeToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :size, :integer
  end
end
