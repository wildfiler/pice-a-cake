class HatedRecipesController < ApplicationController
  before_action :require_login

  def index
    @attitude = 'hate'
    @recipe_attitudes = current_user.
                        recipe_attitudes.
                        includes(receipt: [components: :ingredient]).
                        where(attitude: 'hate').
                        paginate(page: params[:page], per_page: 20)
    render 'recipe_attitudes/index'
  end

  def create
    recipe_attitude = current_user.
                      recipe_attitudes.
                      find_or_initialize_by(receipt_id: params[:receipt_id])
    recipe_attitude.attitude = 'hate'
    if recipe_attitude.save
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end
