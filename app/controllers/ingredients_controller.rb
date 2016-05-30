class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 50)
  end
end
