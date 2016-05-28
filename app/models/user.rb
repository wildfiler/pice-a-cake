class User < BaseModel
  include Clearance::User

  has_many :receipts
  has_many :ingredients
end
