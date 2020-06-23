class Message < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # presence: true→空の文字列は入力できなくなる
  validates :content, presence: true, length: { maximum: 140 }
end
