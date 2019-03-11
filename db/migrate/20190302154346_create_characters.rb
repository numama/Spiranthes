class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string     :name
      t.references :realm, default: 1
      t.references :property, default: 1
      t.integer    :rarity, default: 5
      t.references :type, default: 1
      t.references :special_leaderskill
      t.references :head_leaderskill, default: 1
      t.references :foot_leaderskill, default: 1
      t.string     :skill_name, default: "-"
      t.integer    :skill_point
      t.text       :skill_description, default: "-"
      t.integer    :ability1_id, default: 1
      t.integer    :ability2_id, default: 1
      t.integer    :ability3_id, default: 1
      t.string     :from
      t.string     :motion
      t.integer    :attack_count
      t.integer    :guild_battle_score, default: 0
      t.integer    :rolling_quest_score, default: 0
      t.integer    :arena_score, default: 0
      t.text       :body
      t.boolean    :is_icon, null: false, default: false
      t.boolean    :is_illust, null: false, default: false

      t.timestamps
    end
    add_index :characters, [:name, :from]
  end
end
