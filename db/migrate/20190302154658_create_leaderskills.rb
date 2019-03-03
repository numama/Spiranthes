class CreateLeaderskills < ActiveRecord::Migration[5.2]
  def change
    create_table :leaderskills do |t|
      t.string :name
      t.string :symbol
      t.text :description

      t.timestamps
    end
    add_index :leaderskills, [:name, :symbol]
  end
end
