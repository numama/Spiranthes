class CreateCharacterComments < ActiveRecord::Migration[5.2]
  def change
    create_table :character_comments do |t|
      t.references :character
      t.string :name
      t.string :score
      t.text :body

      t.timestamps
    end
  end
end
