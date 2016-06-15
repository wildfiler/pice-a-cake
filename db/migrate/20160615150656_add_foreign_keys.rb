class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :components, :ingredients
    add_foreign_key :components, :receipts
    add_foreign_key :ingredients, :users
    add_foreign_key :ingredients, :ingredients, column: :parent_id
    add_foreign_key :receipts, :users
  end
end
