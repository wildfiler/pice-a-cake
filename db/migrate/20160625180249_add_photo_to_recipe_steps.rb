class AddPhotoToRecipeSteps < ActiveRecord::Migration
  def change
    add_column :recipe_steps, :photo, :string
  end
end
