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

ActiveRecord::Schema[8.1].define(version: 2026_02_11_070833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "test1s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "test2s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "test1_id", null: false
    t.datetime "updated_at", null: false
    t.index ["test1_id"], name: "index_test2s_on_test1_id"
  end

  create_table "test3s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "test4s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "test3_id", default: 1, null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "phone_number"
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

  create_table "vlogs", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["title"], name: "index_vlogs_on_title"
    t.index ["user_id"], name: "index_vlogs_on_user_id"
  end

  add_foreign_key "test2s", "test1s"
  add_foreign_key "test4s", "test3s"
  add_foreign_key "vlogs", "users"
end
