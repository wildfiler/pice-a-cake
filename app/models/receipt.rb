class Receipt < BaseModel
  belongs_to :user

  has_many :components, dependent: :destroy, inverse_of: :receipt
  has_many :ingredients, through: :components
  has_many :recipe_attitudes, dependent: :destroy
  has_many :cooked_recipes, dependent: :destroy

  accepts_nested_attributes_for :components, reject_if: proc { |a| a[:ingredient_id].blank? }

  validates :title, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  scope :find_by_title, -> (query) { where('title LIKE ?', "%#{query}%") }
  scope :last_ten, -> { ordered.first(10) }

  def vegeterian?
    if ingredients.loaded?
      ingredients.to_a.all?(&:vegeterian?)
    else
      ingredients.all?(&:vegeterian?)
    end
  end

  def cooked_by?(user)
    cooked_recipes.where(user: user).exists?
  end
end
