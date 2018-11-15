class UserGamesController < ApplicationController

  def index
    @user_games = UserGame.all
  end

  def show
    @user_game = UserGame.find_by_id(params[:id])
  end

  def new
    @user_game = UserGame.new
  end

  def create
    game = Game.find_or_create_by(title: user_game_params[:game_title])
    @user_game = UserGame.create(rating: user_game_params[:rating], user_id: user_game_params[:user_id], game_id: game.id)
    redirect_to game_path(game)
  end

private

def user_game_params
  params.require(:user_game).permit(:rating, :user_id, :game_title)
end

end
