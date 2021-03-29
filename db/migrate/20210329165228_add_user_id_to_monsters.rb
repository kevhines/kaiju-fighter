class AddUserIdToMonsters < ActiveRecord::Migration[6.1]
  def change
    add_column :monsters, :user_id, :integer
  end
end
