class Admin::FavoritesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    favorite = current_admin.favorites.new(game_id: game.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_admin.favorites.find_by(game_id: game.id)
    favorite.destroy
    redirect_to request.referer
  end

  # def create
  #   @game = Game.find(params[:game_id])
  #   favorite = @game.favorites.new(admin_id: current_admin.id)
  #   favorite.save
  #   redirect_to request.referer
  # end

  # def destroy
  #   @game = Game.find(params[:game_id])
  #   favorite = @game.favorites.find_by(admin_id: current_admin.id)
  #   favorite.destroy
  #   redirect_to request.referer
  # end




end


