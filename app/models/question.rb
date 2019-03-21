class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :name,
    allow_nil: true,
    length: { in: 0..30, message: "名前は30文字以内で指定してください" },
    exclusion: { in: [".", "/", "happy"], message: "一部記号の使用を禁止しています"}

  validates :body,
    presence: { message: "本文の入力は必須です" },
    length: { in: 10..2000, message: "本文は10〜2000文字で記入してください" },
    exclusion: { in: %w(. / ; < >), message: "一部記号の使用を禁止しています" }

    validate :name_prohibited_sign

    def name_prohibited_sign
      if name =~ /[\.\/\<\>]/
        errors.add(:name, "一部記号の使用を禁止しています")
      end
    end

    validate :body_prohibited_sign

    def body_prohibited_sign
      if body =~ /[\/\<\>]/
        errors.add(:name, "一部記号の使用を禁止しています")
      end
    end
end