class AddAvailableToUserGames < ActiveRecord::Migration[5.2]
  def change
    add_column :user_games, :available, :boolean
  end
end
