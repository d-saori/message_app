class User < ApplicationRecord
  # dependent: :destroy→この表記がないとアカウントを削除しても投稿メッセージ(アソシエーションされたuser.messages)が残ってしまう
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
