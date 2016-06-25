class RenameReceiptToRecipe < ActiveRecord::Migration
  def change
    rename_table :receipts, :recipes
    rename_column :components, :receipt_id, :recipe_id
    rename_column :cooked_recipes, :receipt_id, :recipe_id
    rename_column :recipe_attitudes, :receipt_id, :recipe_id
    rename_column :recipe_steps, :receipt_id, :recipe_id
  end
end
