class CreateRecipeLabels < ActiveRecord::Migration
  def change
    create_table :recipe_labels do |t|
      t.references :recipe, index: true, foreign_key: true, null: false
      t.references :label, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
