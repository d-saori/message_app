class MessagesController < ApplicationController
  # ログイン必須(ログインしていないと)とする
  # 今回はroutes.rbにてtopページ設定をmessage#indexとしているのでログインせずにそのページにアクセス(http://localhost:3000/すればログインしてなくても表示できる)するとログイン画面に移動するようになる
  # 全てのページをログインしないと入れなくなるようにするには「application_controller」に記入する
  # before_action :authenticate_user!, except: :index→indexページだけログインしてなくても表示できる
  before_action :authenticate_user!
  # 自分のメッセージであるかどうかをチェックする
  # 他の人のメッセージを編集、更新、削除できないようにする
  # %i:シンボルの配列を作成
  before_action :correct_user, only: %i[edit update destroy]

  def index
    # ***** (Message.allはよくない) *****
    @messages = Message.includes(:user)
    # ユーザーが「いいね！」した全てのメッセージidの配列
    # pluckメソッド:mapと同義。
    # current_user.likes.pluck(:message_id)→自分がお気に入りしたメッセージのID(の配列)を取ってくる
    @liked_message_ids = current_user.likes.pluck(:message_id)
  end

  def new
    @message = Message.new
  end

  def create
    # 自分が投稿したメッセージなので「@message = Message.create!」ではなく「ログインしているユーザ:currect_user」
    current_user.messages.create!(message_params)
    redirect_to root_path
  end

  # def current_userで既にmessageがfindされているのでここは記入無しでOK
  def edit
  end

  def update
    # @message:currect_userの@message
    # message_params:↓のdef message_paramsのparams.require(:message).permit(:content)(contentを取ってくる)
    @message.update!(message_params)
    # updateが終わったらTOPページに戻る
    redirect_to root_path
  end

  def destroy
    # @message = Message.find(params[:id]で指定されたメッセージを削除
    @message.destroy!
    # TOPページ(messages#index)へ移動
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  # 自分のメッセージかどうか
  def correct_user
    # (params[:id]):どのメッセージであるか
    # 探す部分(find)は共通なのでdestroyアクションじゃなくてこっちに書いてもいい
    # @message = Message.find(params[:id])
    # ↑のMessage.findだと自分のメッセージかどうかわからない
    # @message = current_user.messages.find(params[:id])
    # 更にfindだとメッセージが見つからなかった場合エラーが出てしまうのでfind_by(見つからない場合nilになる=自分が投稿したメッセージではないとわかる)に変更
    @message = current_user.messages.find_by(id: params[:id])
    # ↑でnilだった(他人のメッセージの場合)TOPページにredirectさせる
    redirect_to root_path if @message.nil?
  end
end
