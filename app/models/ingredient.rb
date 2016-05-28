class Ingredient < BaseModel
  belongs_to :user
  has_many :components
  has_many :receipts, through: :components
  belongs_to :parent, class_name: :ingredient
end
