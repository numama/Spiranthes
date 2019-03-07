require "csv"

# realm
CSV.read("db/import/seeds/realms.csv", headers: true).each do |row|
  Realm.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# propaty
CSV.read("db/import/seeds/properties.csv", headers: true).each do |row|
  Property.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# type
CSV.read("db/import/seeds/types.csv", headers: true).each do |row|
  Type.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# special leaderskills
CSV.read("db/import/seeds/special_leaderskills.csv", headers: true).each do |row|
  SpecialLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# head leaderskills
CSV.read("db/import/seeds/head_leaderskills.csv", headers: true).each do |row|
  HeadLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# foot leaderskills
CSV.read("db/import/seeds/foot_leaderskills.csv", headers: true).each do |row|
  FootLeaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# abilities
CSV.read("db/import/seeds/abilities.csv", headers: true).each do |row|
  Ability.create(
    name: row["name"],
    symbol: row["symbol"],
    category: row["category"],
    description: row["description"]
  )
end

# characters
CSV.read("db/import/seeds/characters.csv", headers: true).each do |row|
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