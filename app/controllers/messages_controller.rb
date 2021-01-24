class MessagesController < ApplicationController
  
  def create
    @message = current_user.messages.build(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
    if @message.save
      redirect_back(fallback_location: root_path)
    else
      @room = Room.find(params[:message][:room_id])
      @message_list = @room.messages.order(id: :desc).page(params[:page]).per(10)
      flash.now[:danger] = "メッセージ送信に失敗しました。"
      render "/rooms/show"
    end
  end

end
