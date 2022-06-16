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
    # @game = current_game
    @pages = Game.all.page(params[:page]).per(8)
    @tag_list = Tag.all
  end

  def show
    @game = Game.find(params[:id])
    @game_tags = @game.tags
    @tag_list = Tag.all
  end

  def search_tag
    @tag_list=Tag.all
    @games=Game.where("title LIKE ?", "%#{@game_title}%").page(params[:page])
    @games_all_count= Game.where("title LIKE ?", "%#{@game_title}%").count
    if params[:tag_id]
      #検索されたタグを受け取る
      @tag=Tag.find(params[:tag_id])
     #検索されたタグに紐づく投稿を表示
    else
      @game_title=params[:title]
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :body, :image)
  end

end

