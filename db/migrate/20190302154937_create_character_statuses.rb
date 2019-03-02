class CreateCharacterStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :character_statuses do |t|
      t.references :character

      t.integer :speed
      t.integer :speed_released_board

      t.integer :hp_max
      t.integer :hp_superimposed
      t.integer :hp_released_board
      t.integer :hp_released_level
      
      t.integer :attack_max
      t.integer :attack_superimposed
      t.integer :attack_released_board
      t.integer :attack_released_level

      t.timestamps
    end
  end
end
