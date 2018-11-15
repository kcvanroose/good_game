class User < ApplicationRecord
  has_many :wishlist_games
  has_many :desired_games, through: :wishlist_games, :source => :game
  has_many :user_games
  has_many :games, through: :user_games
  validates :name, presence: true, uniqueness: true
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  def average_rating
    if self.user_games.count == 0
      return "Not enough ratings"
    end
    total_ratings = self.user_games.map {|ur| ur.rating }

    total_ratings.inject{ |sum, el| sum + el }.to_i / total_ratings.size
  end

  def add_to_wishlist(game)
    @user.desired_games << game
  end

end
