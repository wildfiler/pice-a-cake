class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.ordered.paginate(page: params[:page], per_page: 10)
  end

  def show
    @receipt = Receipt.find(params[:id])
  end
end
