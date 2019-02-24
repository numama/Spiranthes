class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, message: '短すぎます'}
  validates :body, presence: true
end
