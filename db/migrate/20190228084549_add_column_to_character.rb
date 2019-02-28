class AddColumnToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :guild_battle_scores, :integer
    add_column :characters, :rolling_quest_scores, :integer
    add_column :characters, :body, :text
  end
end
