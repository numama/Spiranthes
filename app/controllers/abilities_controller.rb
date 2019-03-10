class AbilitiesController < ApplicationController
  def show
    @ability = Ability.find_by(params[:id])
    @characters = @ability.characters.select(
      :id, :name, :rarity, :property_id, :realm_id, :type_id, :rolling_quest_score, :guild_battle_score
    ).includes(:property, :realm)
  end
end
