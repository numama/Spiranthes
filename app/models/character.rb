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

  # validates :name,
  #   presence: true, 
  #   uniqueness: true
  # validates :realm_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true
  # validates :attribute_id,
  #   presence: true,
  #   length: { in: 1..3 },
  #   numericality: true
  # validates :rarity,
  #   presence: true,
  #   length: { is: 1 }, 
  #   numericality: true
  # validates :type_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true
  # validates :leaderskill_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true
  # validates :ability1_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true
  # validates :ability2_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true
  # validates :ability3_id, 
  #   presence: true, 
  #   length: { in: 1..3 }, 
  #   numericality: true

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
  


end
