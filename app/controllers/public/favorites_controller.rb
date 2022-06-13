class Public::FavoritesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.new(customer_id: current_customer.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
    # redirect_to request.referer
  end

  def index
     @favorites = current_customer.favorites.page(params[:page]).per(8)
 
  end

  def favorite_params
    params.require(:favorite).permit(:game_id, :customer_id)
  end
end
