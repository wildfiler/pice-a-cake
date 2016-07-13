class RecipeLabel < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :label

  validates :recipe_id, :label_id, presence: true
end
