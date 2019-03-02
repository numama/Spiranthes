class CharacterComment < ApplicationRecord
  validates :name,
    lnegth: { in: 1..30, allow_nil: true, message: "名前は30文字以内で指定してください" }
  validates :score,
    lnegth: { in: 1..3, allow_nil: true },
    numericality: true
  validates :body,
    presence: { true, message: "コメント本文の入力は必須です" },
    length: { minimum: 5, message: "5文字以上記述してください" }
    length: { maximam: 1000, message: "1000文字以内で記述してください" }
end
