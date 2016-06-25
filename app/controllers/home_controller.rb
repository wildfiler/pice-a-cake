class HomeController < ApplicationController
  def index
    @last_ten_recipes = Recipe.includes(components: :ingredient).last_ten
  end
end
