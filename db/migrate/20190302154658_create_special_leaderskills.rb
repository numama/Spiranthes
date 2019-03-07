class CreateSpecialLeaderskills < ActiveRecord::Migration[5.2]
  def change
    create_table :special_leaderskills do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :special_leaderskills, [:name]
  end
end
