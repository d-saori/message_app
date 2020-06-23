class MessagesController < ApplicationController
  # ログイン必須(ログインしていないと)とする
  # 今回はroutes.rbにてtopページ設定をmessage#indexとしているのでログインせずにそのページにアクセス(http://localhost:3000/すればログインしてなくても表示できる)するとログイン画面に移動するようになる
  # 全てのページをログインしないと入れなくなるようにするには「application_controller」に記入する
  # before_action :authenticate_user!, except: :index→indexページだけログインしてなくても表示できる
  before_action :authenticate_user!

  def index
    # ***** (Message.allはよくない) *****
    @messages = Message.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    # 自分が投稿したメッセージなので「@message = Message.create!」ではなく「ログインしているユーザ:current_user」
    current_user.messages.create!(message_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
    # ([params:id]):どのメッセージであるか
    @message = Message.find([params:id])
    # ↑で指定されたメッセージを削除
    @message.destroy!
    # messages#indexへ移動
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
