class MessagesController < ApplicationController
  
  def create
    if Room.where(room_id: params[:room_id])
      @message = Message.create(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end
  
end
