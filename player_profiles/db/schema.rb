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

ActiveRecord::Schema.define(version: 20150726195154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "achievements", ["title"], name: "index_achievements_on_title", unique: true, using: :btree

  create_table "player_achievements", force: :cascade do |t|
    t.integer  "player_id",      null: false
    t.integer  "achievement_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "player_achievements", ["player_id", "achievement_id"], name: "index_player_achievements_on_player_id_and_achievement_id", unique: true, using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["name"], name: "index_players_on_name", unique: true, using: :btree

  create_table "scores", force: :cascade do |t|
    t.integer  "player_id",  null: false
    t.string   "game_type",  null: false
    t.integer  "score",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
