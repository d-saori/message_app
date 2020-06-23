class Like < ApplicationRecord
  # Userモデル対Likeモデル=1対多
  belongs_to :user
  # Messageモデル対Likeモデル=1対多
  belongs_to :message
  # presence: true→存在するということ。user_idやmessage_idが欠けてる状態はNG
  # uniqueness: { scope: :message_id }→user_idの方に対してmessage_idとの組み合わせを1つまでとする
  validates :user_id, presence: true, uniqueness: { scope: :message_id }
  validates :message_id, presence: true
end
