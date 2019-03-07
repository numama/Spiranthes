class HeadLeaderskill < ApplicationRecord
  has_many :characters

  def self.get_array
    if  items = self.select(:id, :description)
      items.all.map do |ls|
        [ls.description, ls.id]
      end
    else
      []
    end
  end
end
