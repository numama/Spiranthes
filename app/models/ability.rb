class Ability < ApplicationRecord
  has_many :ability1, class_name: 'Character', :foreign_key => 'ability1_id'
  has_many :ability2, class_name: 'Character', :foreign_key => 'ability2_id'
  has_many :ability3, class_name: 'Character', :foreign_key => 'ability3_id'

  def self.get_array
    if abilities = self.select(:id, :name, :category)
      abilities.map do |ability|
        [ability.name, ability.id]
      end
    else
      []
    end
  end

  def self.get_array_by_category
    if items = self.select(:id, :name, :category)
      result = {}
      (1..3).each do |n|
        result["ability#{n}"] = items.where(category: n).map do |ability|
          [ability.name, ability.id]
        end
      end
      return result
    else
      []
    end
  end

end
