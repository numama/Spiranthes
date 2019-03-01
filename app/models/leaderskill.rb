class Leaderskill < ApplicationRecord
  has_many :characters

  def self.get_array
    if  leaderskills = self.select(:id, :name, :description)
      leaderskills.all.map do |ls|
        ["#{ls.name} : #{ls.description}", ls.id]
      end
    else
      []
    end
  end
end
