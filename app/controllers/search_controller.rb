class SearchController < ApplicationController
  def index
    @recipes = Recipe.
                includes(components: :ingredient).
                find_by_title(params[:search]).
                paginate(page: params[:page], per_page: 10)
    render 'recipes/index'
  end
end
