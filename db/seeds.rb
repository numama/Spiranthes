# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Post.create(title: "title #{i}", body: "body#{i}")
end

Character.create(
  name: "ゼクス",
  realm_id: 1,
  property_id: 1,
  rarity: 5,
  type_id: 1,
  leaderskill_id: 1,
  skill: "skill",
  skill_description: "description",
  ability1_id: 1,
  ability2_id: 2,
  ability3_id: 3
)
Character.create(
  name: "バルザック",
  realm_id: 2,
  property_id: 4,
  rarity: 5,
  type_id: 2,
  leaderskill_id: 2,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 4,
  ability3_id: 5
)

Character.create(
  name: "ネロ",
  realm_id: 3,
  property_id: 3,
  rarity: 5,
  type_id: 4,
  leaderskill_id: 3,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 4,
  ability3_id: 6
)

Character.create(
  name: "スライ",
  realm_id: 3,
  property_id: 3,
  rarity: 5,
  type_id: 4,
  leaderskill_id: 3,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 4,
  ability3_id: 6
)

Character.create(
  name: "オラクル",
  realm_id: 3,
  property_id: 3,
  rarity: 5,
  type_id: 4,
  leaderskill_id: 3,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 4,
  ability3_id: 6
)

Character.create(
  name: "メルディア",
  realm_id: 3,
  property_id: 3,
  rarity: 5,
  type_id: 4,
  leaderskill_id: 3,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 4,
  ability3_id: 6
)