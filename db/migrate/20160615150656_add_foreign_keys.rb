class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :components, :ingredients
    add_foreign_key :components, :recipes
    add_foreign_key :ingredients, :users
    add_foreign_key :ingredients, :ingredients, column: :parent_id
    add_foreign_key :recipes, :users
  end
end
