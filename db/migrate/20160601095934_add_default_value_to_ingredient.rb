class AddDefaultValueToIngredient < ActiveRecord::Migration
  def change
    change_column :ingredients, :vegeterian, :boolean, default: false
    change_column :ingredients, :spice, :boolean, default: false
  end
end
