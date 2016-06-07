class Receipt < BaseModel
  belongs_to :user
  has_many :components, dependent: :destroy
  has_many :ingredients, through: :components

  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  def vegeterian?
    if ingredients.loaded?
      ingredients.to_a.all?(&:vegeterian?)
    else
      ingredients.all?(&:vegeterian?)
    end
  end
end
