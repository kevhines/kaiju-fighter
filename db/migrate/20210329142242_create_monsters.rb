class CreateMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :health, default: 100
      t.integer :size
      t.integer :user_id
      t.timestamps
    end
  end
end
