class Admin::GamesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @game =Game.new
  end

  def edit
    @game =Game.find(params[:id])
    @tag_list=@game.tags.pluck(:name).join(',')
  end

  def index
    @games = Game.all.order(created_at: :desc).page(params[:page]).per(8)
    @sort_games = params[:sort_games]
    @tags= Tag.all
    @games_all_count= Game.all.count
  end

  def create
    @game=Game.new(game_params)
    @game.admin_id = current_admin.id
    tag_list = params[:game][:name].split(',')
    if @game.save
       @game.save_tags(tag_list)
      flash[:notice]="新規登録しました"
      redirect_to admin_games_path
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    tag_list = params[:game][:name].split(',')
    if @game.update(game_params)
       @game.save_tags(tag_list)
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
    @game_tags = @game.tags
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
    params.require(:game).permit(:title, :body,  images: [])
  end

end
