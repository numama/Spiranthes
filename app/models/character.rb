class Character < ApplicationRecord

  belongs_to :realm, optional: true
  belongs_to :property, optional: true
  belongs_to :type, optional: true
  belongs_to :special_leaderskill, optional: true
  belongs_to :head_leaderskill, optional: true
  belongs_to :foot_leaderskill, optional: true
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

end
