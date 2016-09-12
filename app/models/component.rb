class Component < BaseModel
  belongs_to :recipe
  belongs_to :ingredient

  validates :ingredient_id, :recipe, presence: true
  validates :ingredient_id, uniqueness: { scope: :recipe_id }
end
