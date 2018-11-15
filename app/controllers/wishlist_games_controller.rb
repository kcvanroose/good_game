class WishlistGamesController < ApplicationController

  def index
    @wishlist_games = WishlistGame.all
  end

  def show
    @wishlist_game = WishlistGame.find_by_id(params[:id])
  end

  def new
    @wishlist_game = WishlistGame.new
  end

  def create
    @wishlist_game = WishlistGame.create(wishlist_game_params)
  end

  def destroy
    @wishlist_game.destroy
  end

private

def wishlist_game_params
  params.require(:wishlist_game).permit(:user_id, :game_id)
end

end
