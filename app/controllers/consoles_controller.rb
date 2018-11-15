class ConsolesController < ApplicationController

  def index
    @consoles = Console.all
  end

  def show
    @console = Console.find_by_id(params[:id])
  end
  
end
