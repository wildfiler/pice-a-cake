class CookedRecipesController < ApplicationController
  before_action :require_login

  def index
    @cooked_recipes = current_user.
                      cooked_recipes.
                      includes(recipe: [components: :ingredient]).
                      paginate(page: params[:page], per_page: 20)
  end

  def create
    cooked_recipe = current_user.cooked_recipes.new(recipe_id: params[:recipe_id])
    if cooked_recipe.save
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end
