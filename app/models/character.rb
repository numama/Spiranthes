class Character < ApplicationRecord

  belongs_to :realm
  belongs_to :property
  belongs_to :type
  belongs_to :special_leaderskill, optional: true
  belongs_to :head_leaderskill, optional: true
  belongs_to :head_leaderskill, optional: true
  belongs_to :ability1, class_name: 'Ability', :foreign_key => 'ability1_id', optional: true
  belongs_to :ability2, class_name: 'Ability', :foreign_key => 'ability2_id', optional: true
  belongs_to :ability3, class_name: 'Ability', :foreign_key => 'ability3_id', optional: true
  has_one :character_status

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

end
