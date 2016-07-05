class CreateBaseTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false

      t.timestamps null: false
    end

    create_table :receipts do |t|
      t.references :user
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end

    create_table :ingredients do |t|
      t.references :user
      t.references :parent
      t.string :name, null: false
      t.boolean :spice, null: false
      t.boolean :vegeterian, null: false

      t.timestamps null: false
    end

    create_table :components do |t|
      t.references :receipt, null: false
      t.references :ingredient, null: false
      t.integer :quantity
      t.string :units

      t.timestamps null: false
    end
  end
end
