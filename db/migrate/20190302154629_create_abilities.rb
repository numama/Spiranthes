class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :category
      t.text :description
      t.string :level1
      t.string :level2
      t.string :level3
      t.string :level4
      t.string :level5

      t.timestamps
    end
    add_index :abilities, [:name, :category]
  end
end
