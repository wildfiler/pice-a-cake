class User < BaseModel
  include Clearance::User

  has_many :receipts
  has_many :ingredients
  has_many :ingredient_attitudes, dependent: :destroy
  has_many :recipe_attitudes, dependent: :destroy
end
