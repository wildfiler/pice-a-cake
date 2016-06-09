class SearchController < ApplicationController
  def index
    @receipts = Receipt.find_by_title(params[:search]).paginate(page: params[:page], per_page: 10)
    render 'receipts/index'
  end
end