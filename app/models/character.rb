class Character < ApplicationRecord

  belongs_to :realm
  belongs_to :property
  belongs_to :type
  belongs_to :special_leaderskill, optional: true
  belongs_to :head_leaderskill
  belongs_to :foot_leaderskill
  belongs_to :ability1, class_name: 'Ability', :foreign_key => 'ability1_id'
  belongs_to :ability2, class_name: 'Ability', :foreign_key => 'ability2_id'
  belongs_to :ability3, class_name: 'Ability', :foreign_key => 'ability3_id'
  has_one :character_status, dependent: :destroy

  validates :symbol,
    # presence: { message: "シンボルは必ず入力してください" },
    # uniqueness: { mesasge: "既に存在するシンボルです" },
    presence: true,
    uniqueness: true,
    format: { with: /\A([a-z]|\d)+\z/, message: "シンボルは半角英数字で入力してください"}

  # これを追加するだけでURLの:idのぶぶんがsymbolになる
  def to_param
    symbol
  end

  # characters_tableに表示する情報を引き出すメソッド
  def self.all_for_table
    self.select(
      :id,
      :name,
      :symbol,
      :rarity,
      :property_id,
      :realm_id,
      :type_id,
      :rolling_quest_score,
      :guild_battle_score,
      :is_icon
    ).includes(:property, :realm, :type)
  end

  # 詳細表示に必要なデータを引き出すメソッド
  def self.find_for_show(symbol)
    self.includes(
      :realm, :property, :type, :ability1, :ability2, :ability2, :head_leaderskill, :foot_leaderskill
    ).find_by(symbol: symbol)
  end
  
  # getパラメータからの検索
  # 検索のロジックがあまりにもおそ松
  # これじゃクエリ何回も発行してしまう、もっと良い書き方はないか
  # さらにこういう検索系ってモデルに書くべきだと思う
  # rubyはfalseとnil以外すべて真扱いだよ
  def self.where_by_conditions(characters, cond)
    characters = characters.where(rarity: cond["rarity"].to_i) unless cond["rarity"] == "0"
    characters = characters.where(property_id: cond["property_id"].to_i) unless cond["property_id"] == "0"
    characters = characters.where(realm_id: cond["realm_id"].to_i) unless cond["realm_id"] == "0"
    characters = characters.where(type_id: cond["type_id"].to_i) unless cond["type_id"] == "0"
    return characters
  end

  def self.get_conditions_str(cond)
    result = " | "
    result = result + ["指定なし", "星1", "星2", "星3", "星4", "星5"][cond["rarity"].to_i] + " | " unless cond["rarity"] == "0"
    result = result + ["指定なし", "火", "水", "木", "光", "闇"][cond["property_id"].to_i] + " | " unless cond["property_id"] == "0"
    result = result + ["指定なし", "ヒューマ", "スペア", "アニマル", "ブラッド", "スカイ", "ヘル", "アンノウン"][cond["realm_id"].to_i] + " | " unless cond["realm_id"] == "0"
    result = result + ["指定なし", "アタッカー", "ヒーロー", "キラー", "ジャマー", "ディフェンダー", "サポーター"][cond["type_id"].to_i] + " | " unless cond["type_id"] == "0"
    return "指定なし" if result == " | "
    return result
  end

end
