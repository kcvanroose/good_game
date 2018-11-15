class CreateGameConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_consoles do |t|
      t.integer :game_id
      t.integer :console_id


      t.timestamps
    end
  end
end
