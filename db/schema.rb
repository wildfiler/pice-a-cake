# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160623134014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.integer "receipt_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity"
    t.string "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooked_recipes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "receipt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cooked_recipes", ["receipt_id"], name: "index_cooked_recipes_on_receipt_id", using: :btree
  add_index "cooked_recipes", ["user_id"], name: "index_cooked_recipes_on_user_id", using: :btree

  create_table "ingredient_attitudes", force: :cascade do |t|
    t.string "attitude", null: false
    t.integer "user_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredient_attitudes", ["ingredient_id"], name: "index_ingredient_attitudes_on_ingredient_id", using: :btree
  add_index "ingredient_attitudes", ["user_id"], name: "index_ingredient_attitudes_on_user_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.integer "user_id"
    t.integer "parent_id"
    t.string "name", null: false
    t.boolean "spice", default: false, null: false
    t.boolean "vegeterian", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_attitudes", force: :cascade do |t|
    t.string "attitude", null: false
    t.integer "user_id", null: false
    t.integer "receipt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_attitudes", ["receipt_id"], name: "index_recipe_attitudes_on_receipt_id", using: :btree
  add_index "recipe_attitudes", ["user_id"], name: "index_recipe_attitudes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "components", "ingredients"
  add_foreign_key "components", "receipts"
  add_foreign_key "cooked_recipes", "receipts"
  add_foreign_key "cooked_recipes", "users"
  add_foreign_key "ingredient_attitudes", "ingredients"
  add_foreign_key "ingredient_attitudes", "users"
  add_foreign_key "ingredients", "ingredients", column: "parent_id"
  add_foreign_key "ingredients", "users"
  add_foreign_key "receipts", "users"
  add_foreign_key "recipe_attitudes", "receipts"
  add_foreign_key "recipe_attitudes", "users"
end
