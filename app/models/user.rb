class User < BaseModel
  include Clearance::User

  has_many :recipes
  has_many :ingredients
  has_many :ingredient_attitudes, dependent: :destroy
  has_many :recipe_attitudes, dependent: :destroy
  has_many :cooked_recipes, dependent: :destroy
end
