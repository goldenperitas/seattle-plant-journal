# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_04_094849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creature_resource_tags", force: :cascade do |t|
    t.bigint "creature_resource_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creature_resource_id"], name: "index_creature_resource_tags_on_creature_resource_id"
    t.index ["tag_id"], name: "index_creature_resource_tags_on_tag_id"
  end

  create_table "creature_resources", force: :cascade do |t|
    t.bigint "creature_id", null: false
    t.integer "resource_type", default: 0
    t.string "url"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creature_id"], name: "index_creature_resources_on_creature_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "english_name", null: false
    t.string "scientific_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twulshootseed"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "creature_resource_tags", "creature_resources"
  add_foreign_key "creature_resource_tags", "tags"
  add_foreign_key "creature_resources", "creatures"
end
