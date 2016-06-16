class AddIconToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :icon, :string
  end
end
