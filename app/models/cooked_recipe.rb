class CookedRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :receipt

  validates :user_id, :receipt_id, presence: true
  validates :receipt_id, uniqueness: { scope: :user_id }
end
