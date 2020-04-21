module Api
  class CharactersController < ApplicationController

    # データ管理のところはログインしてないとだめでーす
    # before_action :authentication, only: [:new, :create, :edit, :update, :destroy, :scores]
    # キャラクター情報を更新したときにランク情報を付け直す
    after_action :remake_ranks, only: [:create, :update]

    def index
      characters = Character.all_for_table.order(rolling_quest_score: :desc)
      render json: { status: "SUCCESS", data: characters }
    end

    def show
      character = Character.find_for_show(params[:id])
      render json: { status: "SUCCESS", data: character }
    end

    def create
      character = Character.new(character_params)
      # なんか以下を追加しないとエラーになる
      # 保存時にもこの配列データを参照してるっぽい・・？
      # get_arrays_for_form
      if character.save
        render json: { status: "SUCCESS", data: character }
      else
        render json: { status: "ERROR" }
      end
    end

    def update
      character = Character.find_by(symbol: params[:id])
      #get_arrays_for_form
      if character.update(character_params)
        render json: { status: "SUCCESS", data: character }
      else
        render json: { status: "ERROR" }
      end
    end

    def destroy
      character = Character.find_by(symbol: params[:id])
      character.destroy
      render json: { status: "SUCCESS", data: character }
    end

    # def evaluate
    #   if params[:guild].present?
    #     @characters = Character.all_for_table.order(guild_battle_score: :desc).limit(27)
    #   else
    #     @characters = Character.all_for_table.order(rolling_quest_score: :desc).limit(27)
    #   end
    #   # 名前の横に順位を書く
    #   @characters.each.with_index(1) do |character, i|
    #     character.name = "【#{i}位】 #{character.name}"
    #   end
    #   @title = "ユニット評価ランキング【ラスピリ】"
    # end

    # def scores
    #   if params[:guild].present?
    #     @characters = Character.all.order(guild_battle_score: :desc)
    #   else
    #     @characters = Character.all.order(rolling_quest_score: :desc)
    #   end
    # end

    private
      def get_arrays_for_form
        @head_leaderskill_array = HeadLeaderskill.get_array
        @foot_leaderskill_array = FootLeaderskill.get_array
        @abilities = Ability.get_array_by_category
      end

      # ランキングの上から順にD~Sのランクを付けていくメソッド（重い）
      def remake_ranks
        setting = {
          S: 7,
          A: 20,
          B: 30,
          C: 30,
          D: 30
        }
        characters = Character.all
        counts = characters.count
        others = counts - setting.values.sum if (counts > setting.values.sum)
        rank_ary = ["S"]*setting[:S]+
          ["A"]*setting[:A]+
          ["B"]*setting[:B]+
          ["C"]*setting[:C]+
          ["D"]*setting[:D]+
          ["E"]*others

        rolling_order = characters.order(rolling_quest_score: :desc).map { |i| i.id - 1 }
        guild_order = characters.order(guild_battle_score: :desc).map { |i| i.id - 1 }

        rank_ary.each.with_index(0) do |rank, i|
          characters[rolling_order[i]].rolling_quest_rank = rank
        end
        rank_ary.each.with_index(0) do |rank, i|
          characters[guild_order[i]].guild_battle_rank = rank
        end
        characters.each do |character|
          character.update(
            rolling_quest_rank: character.rolling_quest_rank,
            guild_battle_rank: character.guild_battle_rank
          )
        end
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
          :guild_battle_rank,
          :rolling_quest_score,
          :rolling_quest_rank,
          :arena_score,
          :body,
          :is_icon,
          :is_illust,
          :is_picked
        )
      end
  end
end