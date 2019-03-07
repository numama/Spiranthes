class CreateHeadLeaderskills < ActiveRecord::Migration[5.2]
  def change
    create_table :head_leaderskills do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :head_leaderskills, [:name]
  end
end
