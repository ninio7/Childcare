class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
    @games_all_count= Game.all.count
  end


  def show
    @game = Game.find(params[:id])
  end

private

  def game_params
    params.require(:game).permit(:title, :body, :image)
  end


end

