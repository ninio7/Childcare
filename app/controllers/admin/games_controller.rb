class Admin::GamesController < ApplicationController
  def new
    @game =Game.new
  end

  def edit
    @game =Game.find(params[:id])
  end

  def index
    @games = Game.page(params[:page]).per(6)
    @games_all_count= Game.all.count

    # @admin = current_admin
  end

  def create
    # binding.pry
       @game=Game.new(game_params)
    if @game.save
      flash[:notice]="新規登録しました"
      redirect_to admin_games_path
    else
      render new_admin_game_path
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice]="変更しました"
      redirect_to games_path
    else
      flash[:notice] = "入力してください"
      render :edit
    end
  end

  def destroy
    @game =Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def show
    @game = Game.find(params[:id])
  end


  def sort
    @games = Game.all
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
    params.require(:game).permit(:title, :body, images: [])
  end

end
