class RecipeStep < ActiveRecord::Base
  belongs_to :receipt
  validates :text, :position, :receipt, presence: true

  scope :ordered, -> { order(:position) }
end
