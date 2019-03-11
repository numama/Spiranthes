class FootLeaderskill < ApplicationRecord
  has_many :characters

  def self.get_array
    if  items = self.select(:id, :original_description)
      items.all.map do |ls|
        [ls.original_description, ls.id]
      end
    else
      []
    end
  end
end
