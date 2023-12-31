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

ActiveRecord::Schema[7.0].define(version: 2023_10_12_222557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockbusters", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.integer "store_awards"
    t.boolean "rewards_program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "genre"
    t.integer "release_year"
    t.boolean "restricted"
    t.bigint "blockbuster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blockbuster_id"], name: "index_movies_on_blockbuster_id"
  end

  add_foreign_key "movies", "blockbusters"
end
