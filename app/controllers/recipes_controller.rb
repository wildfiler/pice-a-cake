class RecipesController < ApplicationController
  def index
    @recipes = Recipe.
                ordered.
                paginate(page: params[:page], per_page: 10)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    5.times { @recipe.components.build }
    5.times do |n|
      @recipe.steps.build(position: n)
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title,
                                    :description,
                                    :photo,
                                    :component_id,
                                    components_attributes: [
                                      :units,
                                      :quantity,
                                      :ingredient_id
                                    ],
                                    steps_attributes: [
                                      :text,
                                      :position
                                    ])
  end
end
