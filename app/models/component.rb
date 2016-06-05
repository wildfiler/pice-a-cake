class Component < BaseModel
  belongs_to :receipt
  belongs_to :ingredient

  validates :ingredient_id, :receipt, presence: true
end
