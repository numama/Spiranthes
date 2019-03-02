require "csv"

# realm
CSV.read("db/import/realms.csv", headers: true).each do |row|
  Realm.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# propaty
CSV.read("db/import/properties.csv", headers: true).each do |row|
  Property.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# type
CSV.read("db/import/types.csv", headers: true).each do |row|
  Type.create(
    name: row["name"],
    symbol: row["symbol"]
  )
end

# leaderskills
CSV.read("db/import/leaderskills.csv", headers: true).each do |row|
  Leaderskill.create(
    name: row["name"],
    symbol: row["symbol"],
    description: row["description"]
  )
end

# abilities
CSV.read("db/import/abilities.csv", headers: true).each do |row|
  Ability.create(
    name: row["name"],
    symbol: row["symbol"],
    category: row["category"],
    description: row["description"]
  )
end

# characters
CSV.read("db/import/characters.csv", headers: true).each do |row|
  Character.create(
    name: row["name"],
    symbol: row["symbol"],
    property_id: row["property_id"],
    realm_id: row["realm_id"],
    type_id: row["type_id"],
    rarity: row["rarity"]
  )
  Status.create(
    character_id: row["id"],
    hp_max: row["hp_max"],
    attack_max: row["attack_max"],
    speed_max: row["speed_max"]
  )
end