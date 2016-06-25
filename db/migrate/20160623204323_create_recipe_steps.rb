class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.text :text, null: false
      t.integer :position, null: false
      t.index :position
      t.references :recipe, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
