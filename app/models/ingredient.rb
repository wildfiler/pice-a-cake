class Ingredient < BaseModel
  NOT_HATES_JOIN_QUERY = <<~SQL.freeze
    LEFT JOIN ingredient_attitudes ON ingredients.id = ingredient_attitudes.ingredient_id
                                   AND ingredient_attitudes.user_id = %{user_id}
  SQL

  belongs_to :user
  has_many :components
  has_many :receipts, through: :components
  has_many :ingredient_attitudes, dependent: :destroy
  belongs_to :parent, class_name: Ingredient

  validates :name, presence: true
  validates :vegeterian, :spice, inclusion: { in: [true, false] }

  scope :not_hated_by, lambda { |user|
    joins(NOT_HATES_JOIN_QUERY % { user_id: user.id }).
      where("ingredient_attitudes.id IS NULL OR (ingredient_attitudes.user_id = ?
        AND ingredient_attitudes.attitude != 'hate')", user.id)
  }

  mount_uploader :icon, IconUploader

  def parent_name
    if parent_id.present?
      parent.name
    end
  end

  def loved_by?(user)
    ingredient_attitudes.where(user: user, attitude: 'love').exists?
  end
end
