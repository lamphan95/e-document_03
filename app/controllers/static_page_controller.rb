class StaticPageController < ApplicationController
  def home
    @documents = Document.page(params[:page]).order_by_created_at
    @categories = Category.all
    return unless user_signed_in?
    @user = current_user
  end
end
