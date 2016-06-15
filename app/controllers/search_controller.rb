class SearchController < ApplicationController
  def index
    @receipts = Receipt.
                includes(components: :ingredient).
                find_by_title(params[:search]).
                paginate(page: params[:page], per_page: 10)
    render 'receipts/index'
  end
end
