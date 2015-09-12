class MessagesController < ApplicationController
  def index
    #Massageをすべて取得する。
    @messages = Message.all
  end
  
  ##ここから追記
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path, notice:'メッセージを保持しました'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
    # params[:message]のパラメータで name , bodyのみを許可する。
    # 返り値は ex:) {name: "入力されたname" , body: "入力されたbody" 
  end
  ##ここまで
end
