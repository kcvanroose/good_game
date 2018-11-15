class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def games
    Game.all.each do |game|
      if game.genre_id == @genre.id
    puts game.title
  end
end
end

end
