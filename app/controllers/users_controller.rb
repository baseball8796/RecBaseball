class UsersController < ApplicationController
  before_action :require_user_logged_in,only: [:show, :edit, :message_lists]
  before_action :correct_user, only: [:edit, :update, :message_lists]
  
  def show
    @user = User.find(params[:id])
    @team_informations = @user.team_informations.order(id: :desc).page(params[:page]).per(1)
    @rooms = @user.rooms.order(id: :desc).page(params[:page]).per(3)
    @participate_user = Room.where(participate_id: current_user)
    @participate_room = @participate_user.order(id: :desc).page(params[:page]).per(3)
  end
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'ユーザー情報は正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報は更新されませんでした'
      render :edit
    end
  end
  
  def message_lists
    @message_lists = current_user.feed_messages.order(id: :desc).page(params[:page]).per(5)
  end
  
  
private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :baseball_experience)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
  
end