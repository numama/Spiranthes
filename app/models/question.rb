class Question < ApplicationRecord
  has_one :answer, dependent: :destroy

  validates :name,
    allow_nil: true,
    length: { in: 0..30, message: "名前は30文字以内で指定してください" },
    exclusion: { in: %w(~ ` @ # $ % ^ * + = [ ] { } | : ; \' \" / . > , < \\), message: "名前に記号は使えません"}

  validates :body,
    presence: { message: "本文の入力は必須です" },
    length: { in: 10..2000, message: "本文は10〜2000文字で記入してください" },
    exclusion: { in: %w(. / ; < >), message: "一部記号の使用を禁止しています" }
end
