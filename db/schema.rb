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

ActiveRecord::Schema.define(version: 20160912122001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity"
    t.string "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "components", ["recipe_id", "ingredient_id"], name: "index_components_on_recipe_id_and_ingredient_id", unique: true, using: :btree

  create_table "cooked_recipes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cooked_recipes", ["recipe_id"], name: "index_cooked_recipes_on_recipe_id", using: :btree
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

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_attitudes", force: :cascade do |t|
    t.string "attitude", null: false
    t.integer "user_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_attitudes", ["recipe_id"], name: "index_recipe_attitudes_on_recipe_id", using: :btree
  add_index "recipe_attitudes", ["user_id"], name: "index_recipe_attitudes_on_user_id", using: :btree

  create_table "recipe_labels", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "label_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_labels", ["label_id"], name: "index_recipe_labels_on_label_id", using: :btree
  add_index "recipe_labels", ["recipe_id"], name: "index_recipe_labels_on_recipe_id", using: :btree

  create_table "recipe_steps", force: :cascade do |t|
    t.text "text", null: false
    t.integer "position", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  add_index "recipe_steps", ["position"], name: "index_recipe_steps_on_position", using: :btree
  add_index "recipe_steps", ["recipe_id"], name: "index_recipe_steps_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

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
  add_foreign_key "components", "recipes"
  add_foreign_key "cooked_recipes", "recipes"
  add_foreign_key "cooked_recipes", "users"
  add_foreign_key "ingredient_attitudes", "ingredients"
  add_foreign_key "ingredient_attitudes", "users"
  add_foreign_key "ingredients", "ingredients", column: "parent_id"
  add_foreign_key "ingredients", "users"
  add_foreign_key "recipe_attitudes", "recipes"
  add_foreign_key "recipe_attitudes", "users"
  add_foreign_key "recipe_labels", "labels"
  add_foreign_key "recipe_labels", "recipes"
  add_foreign_key "recipe_steps", "recipes"
  add_foreign_key "recipes", "users"
end
