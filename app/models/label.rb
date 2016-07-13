class Label < ActiveRecord::Base
  has_many :recipe_labels, dependent: :destroy
  has_many :recipes, through: :recipe_labels

  validates :name, presence: true
end
