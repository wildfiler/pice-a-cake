class User < BaseModel
  has_many :receipts
  has_many :ingredients
end
