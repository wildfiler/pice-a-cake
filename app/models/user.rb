class User < BaseModel
  has_many :receipts
  has_many :ingredients

  def abc
    "verylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylonglineverylongline"
  end
end
