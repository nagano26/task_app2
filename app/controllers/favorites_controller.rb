class FavoritesController < ApplicationController

    def create
        @favorite = current_user.favorites.create(room_id: params[:room_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @room = Room.find(params[:room_id])
        @favorite = current_user.favorites.find_by(room_id: @room.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
