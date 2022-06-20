class Admin::FavoritesController < ApplicationController
  
  #管理者にいいね機能をつける場合↓
  
  # def create
  #   @game = Game.find(params[:game_id])
  #   favorite = @game.favorites.new(customer_id: current_admin.id)
  #   favorite.save
  # end

  # def destroy
  #   @game = Game.find(params[:game_id])
  #   favorite = @game.favorites.find_by(customer_id: current_admin.id)
  #   favorite.destroy
  # end
  

end


