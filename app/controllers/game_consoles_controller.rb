class GameConsolesController < ApplicationController

  def new
    @game_console = GameConsole.new
  end

  def create
    @game_console = GameConsole.new(game_console_params)
    @game_console.save
  end

  private

  def game_console_params
    params.require(:game_console).permit(:game_id, :console_id)
  end



end
