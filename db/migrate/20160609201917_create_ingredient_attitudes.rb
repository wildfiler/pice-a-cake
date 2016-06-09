class CreateIngredientAttitudes < ActiveRecord::Migration
  def change
    create_table :ingredient_attitudes do |t|
      t.string :attitude, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.references :ingredient, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
