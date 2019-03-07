class CreateFootLeaderskills < ActiveRecord::Migration[5.2]
  def change
    create_table :foot_leaderskills do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :foot_leaderskills, [:name]
  end
end
