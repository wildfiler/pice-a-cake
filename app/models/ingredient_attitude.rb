class IngredientAttitude < ActiveRecord::Base
  ATTITUDES = %w(love hate).freeze

  belongs_to :user
  belongs_to :ingredient

  validates :user_id, :ingredient_id, presence: true
  validates :attitude, inclusion: { in: ATTITUDES }
  validates :ingredient_id, uniqueness: { scope: :user_id }
end
