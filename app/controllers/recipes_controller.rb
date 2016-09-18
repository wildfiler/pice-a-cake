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
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
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
                                      :ingredient_id,
                                      :id,
                                      :_destroy
                                    ],
                                    steps_attributes: [
                                      :text,
                                      :position,
                                      :photo,
                                      :id,
                                      :_destroy
                                    ])
  end
end
