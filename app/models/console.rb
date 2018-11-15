class Console < ApplicationRecord
  has_many :game_consoles
  has_many :games, through: :game_consoles
end
