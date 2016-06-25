class CookedRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user_id, :recipe_id, presence: true
  validates :recipe_id, uniqueness: { scope: :user_id }
end
