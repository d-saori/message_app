class User < ApplicationRecord
  # dependent: :destroy→この表記がないとアカウントを削除しても投稿メッセージ(アソシエーションされたuser.messages)が残ってしまう
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_messages で user が「いいね!」しているメッセージ一覧が取得できるようになる
  has_many :liked_messages, through: :likes, source: :message
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
