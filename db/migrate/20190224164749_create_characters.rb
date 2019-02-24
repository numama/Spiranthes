class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :realm_id
      t.integer :property_id
      t.integer :rarity
      t.integer :type_id
      t.integer :leaderskill_id
      t.string  :skill
      t.text    :skill_description
      t.integer :ability1_id
      t.integer :ability2_id
      t.integer :ability3_id

      t.timestamps
    end
  end
end
