class CreateCharacterStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :character_statuses do |t|
      t.integer :character_id

      t.timestamps
    end
  end
end
