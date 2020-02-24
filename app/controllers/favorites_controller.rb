class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'Like this post!'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    #binding.pry
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'Remove your Like'
    redirect_back(fallback_location: root_path)
  end
end
