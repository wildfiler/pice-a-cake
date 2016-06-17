class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.
                   not_hated_by(current_user).
                   paginate(page: params[:page], per_page: 50)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :vegeterian, :spice, :parent_id, :icon)
  end
end
