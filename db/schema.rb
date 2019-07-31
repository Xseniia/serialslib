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

ActiveRecord::Schema.define(version: 2019_07_31_104422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "episode_id", null: false
    t.text "content", null: false
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comments_on_comment_id"
    t.index ["episode_id"], name: "index_comments_on_episode_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name", null: false
    t.string "shortcut", limit: 2, null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.bigint "season_id"
    t.string "title"
    t.integer "likes"
    t.integer "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "favourites", id: false, force: :cascade do |t|
    t.bigint "serial_id", null: false
    t.bigint "user_id", null: false
    t.index ["serial_id"], name: "index_favourites_on_serial_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "serial_id"
    t.boolean "is_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serial_id"], name: "index_seasons_on_serial_id"
  end

  create_table "serial_actors", id: false, force: :cascade do |t|
    t.bigint "serial_id", null: false
    t.bigint "actor_id", null: false
    t.index ["actor_id"], name: "index_serial_actors_on_actor_id"
    t.index ["serial_id"], name: "index_serial_actors_on_serial_id"
  end

  create_table "serial_genres", id: false, force: :cascade do |t|
    t.bigint "serial_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id"], name: "index_serial_genres_on_genre_id"
    t.index ["serial_id"], name: "index_serial_genres_on_serial_id"
  end

  create_table "serials", force: :cascade do |t|
    t.string "title"
    t.integer "year_of_premiere"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "country_id"
    t.string "image"
    t.index ["country_id"], name: "index_serials_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.bigint "country_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "comments"
  add_foreign_key "comments", "episodes"
  add_foreign_key "comments", "users"
  add_foreign_key "episodes", "seasons"
  add_foreign_key "favourites", "serials"
  add_foreign_key "favourites", "users"
  add_foreign_key "seasons", "serials"
  add_foreign_key "serial_actors", "actors"
  add_foreign_key "serial_actors", "serials"
  add_foreign_key "serial_genres", "genres"
  add_foreign_key "serial_genres", "serials"
  add_foreign_key "users", "countries"
end
