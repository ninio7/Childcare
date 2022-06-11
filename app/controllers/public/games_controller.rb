class Public::GamesController < ApplicationController
  def index
    @games = Game.all.order(created_at: :desc).page(params[:page])
    case params[:sort_games]
    when "old"
      @games = Game.page(params[:page]).per(8)
    when "lot_favorite"
       @games = Game.all.page(params[:page]).per(8).favorite
    when "few_favorite"
      @games = Game.all.page(params[:page]).per(8).favorite.reverse
    else # default(new)
      @games = Game.latest.page(params[:page]).per(8)
    end
    @games_all_count= Game.all.count
    @game = Game.new
    @customer = current_customer
    @pages = Game.all.page(params[:page]).per(8)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title, :body, :image)
  end

end

