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

ActiveRecord::Schema.define(version: 2019_03_02_154937) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.integer "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "symbol"], name: "index_abilities_on_name_and_symbol"
  end

  create_table "character_statuses", force: :cascade do |t|
    t.integer "character_id"
    t.integer "speed"
    t.integer "speed_released_board"
    t.integer "hp_max"
    t.integer "hp_superimposed"
    t.integer "hp_released_board"
    t.integer "hp_released_level"
    t.integer "attack_max"
    t.integer "attack_superimposed"
    t.integer "attack_released_board"
    t.integer "attack_released_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_statuses_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.integer "realm_id", default: 1
    t.integer "property_id", default: 1
    t.integer "rarity"
    t.integer "type_id", default: 1
    t.integer "leaderskill_id", default: 1
    t.string "skill"
    t.text "skill_description"
    t.integer "ability1_id", default: 1
    t.integer "ability2_id", default: 1
    t.integer "ability3_id", default: 1
    t.integer "guild_battle_score"
    t.integer "rolling_quest_score"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leaderskill_id"], name: "index_characters_on_leaderskill_id"
    t.index ["name", "symbol"], name: "index_characters_on_name_and_symbol"
    t.index ["property_id"], name: "index_characters_on_property_id"
    t.index ["realm_id"], name: "index_characters_on_realm_id"
    t.index ["type_id"], name: "index_characters_on_type_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "leaderskills", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "symbol"], name: "index_leaderskills_on_name_and_symbol"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realms", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
