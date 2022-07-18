class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.new(customer_id: current_customer.id)
    favorite.save
  end

  def destroy
    @game = Game.find(params[:game_id])
    favorite = @game.favorites.find_by(customer_id: current_customer.id)
    favorite.destroy
  end

  def index
     @favorites = current_customer.favorites.page(params[:page]).per(8)
     @favorites_all_count= current_customer.favorites.all.count
  end

  def favorite_params
    params.require(:favorite).permit(:game_id, :customer_id)
  end
end
