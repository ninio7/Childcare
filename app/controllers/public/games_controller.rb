class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(6)
    @games_all_count= Game.all.count
    @game = Game.new
    @customer = current_customer
  end

  def show
    @game = Game.find(params[:id])
  end

  def sort
    @games_all_count= Game.all.count
    case params[:sort_games]
    when "old"
      @games = Game.page(params[:page]).per(8)
    when "high_favorite"
      @games = Game.order(favorite: "DESC").page(params[:page]).per(8)
    when "low_favorite"
      @games =Game.order(favorite: "ASC").page(params[:page]).per(8)
    else # default(new)
      @games = Game.latest.page(params[:page]).per(8)
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :body, :image)
  end




end

