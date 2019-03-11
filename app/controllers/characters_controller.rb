class CharactersController < ApplicationController

  # データ管理のところはログインしてないとだめでーす
  before_action :authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @characters = Character.select_for_table
    # 検索のロジックがあまりにもおそ松
    # これじゃクエリ何回も発行してしまう、もっと良い書き方はないか
    # さらにこういう検索系ってモデルに書くべきだと思う
    # rubyはfalseとnil以外すべて真扱いだよ
    cond = params["character"]
    if cond.present?
      @characters = @characters.where(rarity: cond["rarity"].to_i) unless cond["rarity"] == "0"
      @characters = @characters.where(property_id: cond["property_id"].to_i) unless cond["property_id"] == "0"
      @characters = @characters.where(realm_id: cond["realm_id"].to_i) unless cond["realm_id"] == "0"
      @characters = @characters.where(type_id: cond["type_id"].to_i) unless cond["type_id"] == "0"
    end
  end

  def show
    @character = Character.includes(
      :realm, :property, :type, :ability1, :ability2, :ability2, :head_leaderskill, :foot_leaderskill, :is_icon, :is_illust
    ).find(params[:id])
  end

  def new
    @character = Character.new
    get_leaderskills
    get_abilities
  end

  def create
    @character = Character.new(character_params)
    # なんか以下2つを追加しないとエラーになる
    get_leaderskills
    get_abilities
    if @character.save
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def edit
    @character = Character.find(params[:id])
    get_leaderskills
    get_abilities
  end

  def update
    @character = Character.find(params[:id])
    get_leaderskills
    get_abilities
    if @character.update(character_params)
      redirect_to character_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  def evaluate
    if params[:guild]
      @characters = Character.select_for_table.order(guild_battle_score: :desc)
    else
      @characters = Character.select_for_table.order(rolling_quest_score: :desc)
    end
  end

  private
    def get_leaderskills
      @head_leaderskill_array = HeadLeaderskill.get_array
      @foot_leaderskill_array = FootLeaderskill.get_array
    end

    def get_abilities
      @abilities = Ability.get_array_by_category
    end

    def character_params
      params.require(:character).permit(
        :name,
        :realm_id,
        :property_id,
        :rarity,
        :type_id,
        :special_leaderskill_id,
        :head_leaderskill_id,
        :foot_leaderskill_id,
        :skill,
        :skill_description,
        :ability1_id,
        :ability2_id,
        :ability3_id,
        :guild_battle_score,
        :rolling_quest_score,
        :body
      )
    end
end
