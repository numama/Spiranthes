class CharactersController < ApplicationController

  # データ管理のところはログインしてないとだめでーす
  before_action :authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @characters = Character.all_for_table
    cond = params["character"]
    if cond.present?
      # 検索
      @characters = Character.where_by_conditions(@characters, cond)
      @cond_str = Character.get_conditions_str(cond)
    end
    @title = "ユニット一覧【ラスピリ】"
  end

  def show
    @character = Character.find_for_show(params[:id])
    @title = "#{@character.name}の能力・評価【ラスピリ】"
  end

  def new
    @character = Character.new
    get_arrays_for_form
  end

  def create
    @character = Character.new(character_params)
    # なんか以下を追加しないとエラーになる
    # 保存時にもこの配列データを参照してるっぽい・・？
    get_arrays_for_form
    if @character.save
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def edit
    @character = Character.find_by(symbol: params[:id])
    get_arrays_for_form
  end

  def update
    @character = Character.find_by(symbol: params[:id])
    get_arrays_for_form
    if @character.update(character_params)
      redirect_to character_path(@character.symbol)
    else
      render 'edit'
    end
  end

  def destroy
    @character = Character.find_by(symbol: params[:id])
    @character.destroy
    redirect_to characters_path
  end

  def evaluate
    if params[:guild]
      @characters = Character.all_for_table.order(guild_battle_score: :desc).limit(30)
    else
      @characters = Character.all_for_table.order(rolling_quest_score: :desc).limit(30)
    end
    # 名前の横に順位を書く
    @characters.each.with_index(1) do |character, i|
      character.name = "【#{i}位】 #{character.name}"
    end
    @title = "ユニット評価ランキング【ラスピリ】"
  end

  private
    def get_arrays_for_form
      @head_leaderskill_array = HeadLeaderskill.get_array
      @foot_leaderskill_array = FootLeaderskill.get_array
      @abilities = Ability.get_array_by_category
    end

    def character_params
      params.require(:character).permit(
        :name,
        :symbol,
        :realm_id,
        :property_id,
        :rarity,
        :type_id,
        :special_leaderskill_id,
        :head_leaderskill_id,
        :foot_leaderskill_id,
        :skill_name,
        :skill_point,
        :skill_description,
        :ability1_id,
        :ability2_id,
        :ability3_id,
        :from,
        :motion,
        :attack_count,
        :guild_battle_score,
        :rolling_quest_score,
        :arena_score,
        :body,
        :is_icon,
        :is_illust,
        :is_picked
      )
    end
end
