class User < ApplicationRecord
  has_secure_password validations: true

  validates :name, presence: true, uniqueness: true

  # railsのランダムで一意のトークンを作ってくれるクラスを使う
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # SHA256という64桁のハッシュ化 そんなにいる？
  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
