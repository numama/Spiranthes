require "csv"

# realm
CSV.read("db/import/data/realms.csv", headers: true).each do |row|
  Realm.create!(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# property
CSV.read("db/import/data/properties.csv", headers: true).each do |row|
  Property.create!(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# type
CSV.read("db/import/data/types.csv", headers: true).each do |row|
  Type.create!(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# special leaderskills
CSV.read("db/import/data/special_leaderskills.csv", headers: true).each do |row|
  SpecialLeaderskill.create!(
    name: row["name"],
    description: row["description"]
  )
end

# head leaderskills
CSV.read("db/import/data/head_leaderskills.csv", headers: true).each do |row|
  HeadLeaderskill.create!(
    name: row["name"],
    description: row["description"]
  )
end

# foot leaderskills
CSV.read("db/import/data/foot_leaderskills.csv", headers: true).each do |row|
  FootLeaderskill.create!(
    name: row["name"],
    description: row["description"],
    original_description: row["original_description"]
  )
end

# abilities
CSV.read("db/import/data/abilities.csv", headers: true).each do |row|
  Ability.create!(
    name: row["name"],
    category: row["category"],
    description: row["description"],
    level1: row["level1"],
    level2: row["level2"],
    level3: row["level3"],
    level4: row["level4"],
    level5: row["level5"]
  )
end
