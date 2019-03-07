class SpecialLeaderskill < ApplicationRecord
  has_many :characters

  def self.get_array
    if  items = self.select(:id, :name, :description)
      items.all.map do |ls|
        ["#{ls.name} : #{ls.description}", ls.id]
      end
    else
      []
    end
  end
end
