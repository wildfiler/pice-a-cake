class Receipt < BaseModel
  belongs_to :user
  has_many :components
  has_many :ingredients, through: :components

  def vegeterian?
    if ingredients.loaded?
      ingredients.to_a.all?(&:vegeterian?)
    else
      ingredients.all?(&:vegeterian?)
    end
  end
end
