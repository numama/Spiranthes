class AddColumnToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :guild_battle_evaluation, :string
    add_column :characters, :rolling_quest_evaluation, :string
    add_column :characters, :description, :string
  end
end
