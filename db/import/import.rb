require "csv"

# realm
CSV.read("db/import/realms.csv", headers: true).each do |row|
  Realm.create(
    name: row["name"]
  )
end

# propaty
CSV.read("db/import/properties.csv", headers: true).each do |row|
  Property.create(
    name: row["name"]
  )
end

# type
CSV.read("db/import/types.csv", headers: true).each do |row|
  Type.create(
    name: row["name"]
  )
end

# leaderskills
CSV.read("db/import/leaderskills.csv", headers: true).each do |row|
  Leaderskill.create(
    name: row["name"],
    description: row["description"]
  )
end

# abilities
CSV.read("db/import/abilities.csv", headers: true).each do |row|
  Ability.create(
    name: row["name"],
    description: row["description"]
  )
end