class LikesController < ApplicationController
  # いいね!を付ける(中間テーブル(likesテーブル)のレコードを増やす)場合
  def create
    current_user.likes.create!(message_id: params[:message_id])
    redirect_to root_path
  end

  # いいね!を取り消す(中間テーブル(likesテーブル)のレコードを減らす)場合
  # いいね!を取り消すという事は、いいね!が付いてるレコードがあるのでそれを取得する(find_by)→そしてそれをdestroyで消す
  def destroy
    current_user.likes.find_by(message_id: params[:message_id]).destroy!
    redirect_to root_path
  end
end