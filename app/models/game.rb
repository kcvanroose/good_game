class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  has_many :game_consoles
  has_many :consoles, through: :game_consoles
  belongs_to :genre
  has_many :wishlist_games
  accepts_nested_attributes_for :game_consoles

  def average_rating
    if self.user_games.count == 0
      return "Not enough ratings"
    end
    total_ratings = self.user_games.map {|ur| ur.rating }

    total_ratings.inject{ |sum, el| sum + el }.to_i / total_ratings.size
  end

  def self.search(search)
    where("genre_id LIKE ?", "%#{search}")
  end

  def game_console

  end

  def available_copies
    matched_games = UserGame.all.select {|user_game| user_game.game_id == self.id}
    available_games = matched_games.map {|user_game| user_game.available == true}
    available_games.size
  end





end
