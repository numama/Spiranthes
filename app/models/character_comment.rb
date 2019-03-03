class CharacterComment < ApplicationRecord
  validates :character_id,
    presence: { message: "不正な操作です" }
  validates :name,
    allow_nil: true,
    length: { in: 1..30, message: "名前は30文字以内で指定してください" }
  validates :score,
    allow_nil: true,
    length: { in: 1..3 },
    numericality: { message: "不正な操作です" }
  validates :body,
    length: { in: 5..1000, message: "本文は5~1000文字で記述してください" }
end
