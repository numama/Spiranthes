class AbilitiesController < ApplicationController
  def show
    @ability = Ability.find(params[:id])
    case @ability.category
      when 1
        @characters = @ability.characters1.select(
          :id, :name, :symbol, :rarity, :property_id, :realm_id, :type_id, :rolling_quest_score, :guild_battle_score, :rolling_quest_rank, :guild_battle_rank, :is_icon
        ).includes(:property, :realm)
      when 2
        @characters = @ability.characters2.select(
          :id, :name, :symbol, :rarity, :property_id, :realm_id, :type_id, :rolling_quest_score, :guild_battle_score, :rolling_quest_rank, :guild_battle_rank, :is_icon
        ).includes(:property, :realm)
      when 3
        @characters = @ability.characters3.select(
          :id, :name, :symbol, :rarity, :property_id, :realm_id, :type_id, :rolling_quest_score, :guild_battle_score, :rolling_quest_rank, :guild_battle_rank, :is_icon
        ).includes(:property, :realm)
    end
    @title = "#{@ability.name}の詳細と所持ユニット【ラスピリ】"
  end
end