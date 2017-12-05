class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.order_by_created_at
    @favorites = @favorites.paginate page: params[:page]
  end
end
