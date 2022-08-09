class FavoritesController < ApplicationController
    def create
      landmark = Landmark.find(params[:landmark_id])
      current_user.favorite(landmark)
      redirect_back fallback_location: people_path
    end
  
    def destroy
      landmark = current_user.favorites.find(params[:id]).landmark
      current_user.unfavorite(landmark)
      redirect_back fallback_location: people_path
    end
  end
