class RecipeAttitude < ActiveRecord::Base
  ATTITUDES = %w(love hate).freeze
  belongs_to :user
  belongs_to :receipt

  validates :user_id, :receipt_id, presence: true
  validates :attitude, inclusion: { in: ATTITUDES }
  validates :receipt_id, uniqueness: { scope: :user_id }
end
