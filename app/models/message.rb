class Message < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # message.liked_users で message を「いいね!」しているユーザー一覧が取得できるようになる
  # through: :likes→中間テーブルの部分
  has_many :liked_users, through: :likes, source: :user
  # presence: true→空の文字列は入力できなくなる
  validates :content, presence: true, length: { maximum: 140 }
end
