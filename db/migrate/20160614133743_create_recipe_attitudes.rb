class CreateRecipeAttitudes < ActiveRecord::Migration
  def change
    create_table :recipe_attitudes do |t|
      t.string :attitude, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :recipe, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
