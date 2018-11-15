class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :year_released
      t.integer :genre_id

      t.timestamps
    end
  end
end
