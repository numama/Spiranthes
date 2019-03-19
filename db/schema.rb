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

ActiveRecord::Schema.define(version: 2019_03_18_175724) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.text "description"
    t.string "level1"
    t.string "level2"
    t.string "level3"
    t.string "level4"
    t.string "level5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "category"], name: "index_abilities_on_name_and_category"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "character_comments", force: :cascade do |t|
    t.integer "character_id"
    t.string "name"
    t.string "score"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_comments_on_character_id"
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
    t.integer "rarity", default: 5
    t.integer "type_id", default: 1
    t.integer "special_leaderskill_id"
    t.integer "head_leaderskill_id", default: 1
    t.integer "foot_leaderskill_id", default: 1
    t.string "skill_name", default: "-"
    t.integer "skill_point"
    t.text "skill_description", default: "-"
    t.integer "ability1_id", default: 1
    t.integer "ability2_id", default: 1
    t.integer "ability3_id", default: 1
    t.string "from"
    t.string "motion"
    t.integer "attack_count"
    t.integer "guild_battle_score", default: 0
    t.integer "rolling_quest_score", default: 0
    t.integer "arena_score", default: 0
    t.text "body"
    t.boolean "is_icon", default: false, null: false
    t.boolean "is_illust", default: false, null: false
    t.boolean "is_picked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foot_leaderskill_id"], name: "index_characters_on_foot_leaderskill_id"
    t.index ["head_leaderskill_id"], name: "index_characters_on_head_leaderskill_id"
    t.index ["name", "symbol", "from"], name: "index_characters_on_name_and_symbol_and_from"
    t.index ["property_id"], name: "index_characters_on_property_id"
    t.index ["realm_id"], name: "index_characters_on_realm_id"
    t.index ["special_leaderskill_id"], name: "index_characters_on_special_leaderskill_id"
    t.index ["type_id"], name: "index_characters_on_type_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "foot_leaderskills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "original_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_foot_leaderskills_on_name"
  end

  create_table "head_leaderskills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_head_leaderskills_on_name"
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

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realms", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_leaderskills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_special_leaderskills_on_name"
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
