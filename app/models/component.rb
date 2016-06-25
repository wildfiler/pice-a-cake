class Component < BaseModel
  belongs_to :recipe
  belongs_to :ingredient

  validates :ingredient_id, :recipe, presence: true
end
