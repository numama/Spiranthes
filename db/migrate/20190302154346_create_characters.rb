class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :symbol
      t.references :realm
      t.references :property
      t.integer :rarity
      t.references :type
      t.references :leaderskill
      t.string  :skill
      t.text    :skill_description
      t.integer :ability1_id
      t.integer :ability2_id
      t.integer :ability3_id
      t.integer :guild_battle_score
      t.integer :rolling_quest_score
      t.text    :body

      t.timestamps
    end
    add_index :characters, [:name, :symbol]
  end
end
