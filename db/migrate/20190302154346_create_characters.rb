class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :symbol
      t.references :realm, default: 1
      t.references :property, default: 1
      t.integer :rarity, default: 5
      t.references :type, default: 1
      t.references :special_leaderskill
      t.references :head_leaderskill, default: 1
      t.references :foot_leaderskill, default: 1
      t.string  :skill, default: "-"
      t.text    :skill_description, default: "-"
      t.integer :ability1_id, default: 1
      t.integer :ability2_id, default: 1
      t.integer :ability3_id, default: 1
      t.integer :guild_battle_score, default: 0
      t.integer :rolling_quest_score, default: 0
      t.text    :body

      t.timestamps
    end
    add_index :characters, [:name, :symbol]
  end
end
