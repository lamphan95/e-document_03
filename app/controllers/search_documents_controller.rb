class SearchDocumentsController < ApplicationController
  def search_name
    @documents = Document.search_name_document params[:document][:name_document]
    @documents = @documents.paginate page: params[:page]
    @categories = Category.all
  end

  def search_category
    category = Category.find_by id: params[:id]
    @documents = category.documents.paginate page: params[:page]
    render partial: "search_category"
  end
end
