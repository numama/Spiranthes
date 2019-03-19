# characters
CSV.read("db/import/data/characters.csv", headers: true).each do |row|
  Character.create!(
    name:                     row["name"],
    realm_id:                 row["realm_id"],
    property_id:              row["property_id"],
    rarity:                   row["rarity"],
    type_id:                  row["type_id"],
    from:                     row["from"],
    special_leaderskill_id:   row["special_leaderskill_id"],
    head_leaderskill_id:      row["head_leaderskill_id"],
    foot_leaderskill_id:      row["foot_leaderskill_id"],
    skill_name:               row["skill_name"],
    skill_point:              row["skill_point"],
    skill_description:        row["skill_description"],
    ability1_id:              row["ability1_id"],
    ability2_id:              row["ability2_id"],
    ability3_id:              row["ability3_id"],
    from:                     row["from"],
    motion:                   row["motion"],
    attack_count:             row["attack_count"],
    guild_battle_score:       row["guild_battle_score"],
    rolling_quest_score:      row["rolling_quest_score"],
    arena_score:              row["arena_score"],
    body:                     row["body"],
    is_icon:                  row["is_icon"],
    is_illust:                row["is_illust"],
    is_picked:                row["is_picked"]
  )
end