class Ingredient < BaseModel
  belongs_to :user
  has_many :components
  has_many :receipts, through: :components
  has_many :ingredient_attitudes, dependent: :destroy
  belongs_to :parent, class_name: Ingredient

  validates :name, presence: true
  validates :vegeterian, :spice, inclusion: { in: [true, false] }

  mount_uploader :icon, IconUploader

  def parent_name
    if parent_id.present?
      parent.name
    end
  end
end
