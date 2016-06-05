class Receipt < BaseModel
  belongs_to :user

  has_many :components, dependent: :destroy, inverse_of: :receipt
  has_many :ingredients, through: :components

  accepts_nested_attributes_for :components, reject_if: proc { |a| a[:ingredient_id].blank? }

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
