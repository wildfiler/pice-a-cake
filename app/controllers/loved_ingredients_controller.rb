class LovedIngredientsController < ApplicationController
  before_action :require_login

  def index
    @attitude = 'love'
    @ingredient_attitudes = current_user.
                            ingredient_attitudes.
                            includes(:ingredient).
                            where(attitude: 'love').
                            paginate(page: params[:page], per_page: 50)
    render 'ingredient_attitudes/index'
  end

  def create
    ingredient_attitude = current_user.
                          ingredient_attitudes.
                          find_or_initialize_by(ingredient_id: params[:ingredient_id])
    ingredient_attitude.attitude = 'love'
    if ingredient_attitude.save
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end
