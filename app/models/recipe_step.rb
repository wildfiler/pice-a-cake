class RecipeStep < ActiveRecord::Base
  belongs_to :recipe
  validates :text, :position, :recipe, presence: true

  scope :ordered, -> { order(:position) }

  mount_uploader :photo, PhotoUploader
end
