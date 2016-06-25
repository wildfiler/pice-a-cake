class RecipeAttitude < ActiveRecord::Base
  ATTITUDES = %w(love hate).freeze
  belongs_to :user
  belongs_to :recipe

  validates :user_id, :recipe_id, presence: true
  validates :attitude, inclusion: { in: ATTITUDES }
  validates :recipe_id, uniqueness: { scope: :user_id }
end
