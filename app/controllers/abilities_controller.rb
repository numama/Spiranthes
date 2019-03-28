class AbilitiesController < ApplicationController
  def index
    @ability = Ability.new
    @abilities = Ability.all.order(:desc)
  end

  def create
    @ability = Ability.new(ability_params)
    if @ability.save
      redirect_to abilities_path
    else
      @abilities = []
      render 'index'
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      redirect_to ability_path(params[:id])
    else
      render 'edit'
    end
  end

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

  private
    def ability_params
      arams.require(:ability).permit(:name, :description, :category, :level1, :level2, :level3, :level4, :level5)
    end
end