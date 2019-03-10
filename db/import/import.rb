require "csv"

# realm
Realm.all.destroy_all unless Realm.first
CSV.read("db/import/data/realms.csv", headers: true).each do |row|
  Realm.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# property
Property.all.destroy_all unless Property.first
CSV.read("db/import/data/properties.csv", headers: true).each do |row|
  Property.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# type
Type.all.destroy_all unless Type.first
CSV.read("db/import/data/types.csv", headers: true).each do |row|
  Type.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# special leaderskills
SpecialLeaderskill.all.destroy_all unless SpecialLeaderskill.first
CSV.read("db/import/data/special_leaderskills.csv", headers: true).each do |row|
  SpecialLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# head leaderskills
HeadLeaderskill.all.destroy_all unless HeadLeaderskill.first
CSV.read("db/import/data/head_leaderskills.csv", headers: true).each do |row|
  HeadLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# foot leaderskills
FootLeaderskill.all.destroy_all unless FootLeaderskill.first
CSV.read("db/import/data/foot_leaderskills.csv", headers: true).each do |row|
  FootLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# abilities
Ability.all.destroy_all unless Ability.first
CSV.read("db/import/data/abilities.csv", headers: true).each do |row|
  Ability.create(
    name: row["name"],
    symbol: row["symbol"],
    category: row["category"],
    description: row["description"]
  )
end

# characters
Character.all.destroy_all unless Character.first
CSV.read("db/import/data/characters.csv", headers: true).each do |row|
  Character.create(
    name: row["name"],
    symbol: row["symbol"],
    property_id: row["property_id"],
    realm_id: row["realm_id"],
    type_id: row["type_id"],
    rarity: row["rarity"]
  )
  CharacterStatus.create(
    character_id: row["id"],
    hp_max: row["hp_max"],
    attack_max: row["attack_max"],
    speed: row["speed"]
  )
end