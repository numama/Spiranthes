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

Ability.create(name: "リベンジ", description: "戦闘不能になる時、攻撃してきた敵に大きなダメージを与える")
Ability.create(name: "ガッツ", description: "戦闘不能になる時、一定回数HP1で生き残る")

Property.create(name: "flare")
Property.create(name: "light")

Leaderskill.create(name: "英帝の威光", description: "ヒューマレルム所属ユニットの攻撃力大アップ")
Leaderskill.create(name: "軍帝の乱舞", description: "スペアレルム所属のユニットのスピード大アップ")

Realm.create(name: "ヒューマ")
Realm.create(name: "スペア")

Type.create(name: "アッタッカー")
Type.create(name: "ヒーロー")

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
  ability3_id: 1
)
Character.create(
  name: "バルザック",
  realm_id: 2,
  property_id: 2,
  rarity: 5,
  type_id: 2,
  leaderskill_id: 2,
  skill: "skill bal",
  skill_description: "description bal",
  ability1_id: 1,
  ability2_id: 1,
  ability3_id: 2
)