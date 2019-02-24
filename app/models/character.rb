class Character < ApplicationRecord

  # has_one :realm, :attribute, :type, :leaderskill, :ability

  validates :name,
    presence: true, 
    uniqueness: true
  validates :realm_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true
  validates :attribute_id,
    presence: true,
    length: { in: 1..3 },
    numericality: true
  validates :rarity,
    presence: true,
    length: { is: 1 }, 
    numericality: true
  validates :type_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true
  validates :leaderskill_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true
  validates :ability1_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true
  validates :ability2_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true
  validates :ability3_id, 
    presence: true, 
    length: { in: 1..3 }, 
    numericality: true

end
