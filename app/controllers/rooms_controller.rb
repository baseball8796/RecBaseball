class RoomsController < ApplicationController
  before_action :require_user_logged_in
  before_action :room_user,only: [:show]
  
  def show
    @room = Room.find(params[:id])
    @message_list = @room.messages.order(id: :desc).page(params[:page]).per(10)
    @message = Message.create
  end

  def create
    user = User.find(params[:participate_id])
    @room = current_user.participate(user)
    flash[:success] = 'チャットを始めます。'
    redirect_to @room
  end

  def destroy
    @user = User.find(current_user.id)
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = 'ルームを削除しました。'
    redirect_to user_path(current_user.id)
  end
end

private
 
def room_user
  @room_id = Room.find(params[:id])
  if @room_id.user_id == current_user.id 
  elsif @room_id.participate_id == current_user.id
  else    
    redirect_to user_path(current_user.id)
  end
end