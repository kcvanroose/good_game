class GamesController < ApplicationController

  def index
    if params[:game] and params[:game][:genre_id]
      @games = Game.search(params[:game][:genre_id])
    else
    @games = Game.all
      #if params[:query]
      #  @games = Game.select {|game| game.genre.name == params[:query]}
      #else
      #  @games = Game.all
      end
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def new
    @game = Game.new
    @consoles = Console.all
  end

  def create
    if Game.find_by_title(game_params[:title])
      @game = Game.find_by_title(game_params[:title])
      @game.genre = Genre.find_by_id(game_params[:genre_id])
      @game.year_released = game_params[:year_released]
      @game.save

      GameConsole.create({game_id: @game.id, console_id: game_params[:game_consoles]})
    else
      @game = Game.new(game_params)
      GameConsole.create({game_id: @game.id, console_id: game_params[:game_consoles]})
      @game.save
    end

    if @game.save
      redirect_to game_path(@game)
    else
      flash[:errors] = @game.errors.full_messages
      render :new
    end
    console_id_num = game_params[:game_consoles]
    byebug
  end

  def add_to_wishlist
    @game = Game.find_by_id(params[:id])
    WishlistGame.create({game_id: @game.id, user_id: current_user.id})
    redirect_to wishlist_path(current_user)
  end

  def available_copies
    matched_games = UserGame.all.select {|user_game| user_game.game_id == @game.id}
    available_games = matched_games.map {|user_game| user_game.available == true}
    available_game.size
  end

  def rate
    @game = Game.find_by_id(params[:id])
    UserGame.create({game_id: @game.id, user_id: current_user.id, rating: params[:rating]})
    redirect_to game_path(@game)
  end


private

  def game_params
    params.require(:game).permit(:title, :year_released, :genre_id)
  end

end
