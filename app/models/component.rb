class Component < BaseModel
  belongs_to :receipt
  belongs_to :ingredient

  validates :ingredient_id, :receipt_id, presence: true
end
