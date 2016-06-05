class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.ordered.paginate(page: params[:page], per_page: 10)
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
    5.times { @receipt.components.build }
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to receipt_path(@receipt)
    else
      render :new
    end
  end

  private

  def receipt_params
    params.require(:receipt).permit(:title,
                                    :description,
                                    :component_id,
                                    components_attributes: [
                                      :units,
                                      :quantity,
                                      :receipt_id,
                                      :ingredient_id
                                    ])
  end
end
