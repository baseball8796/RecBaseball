class TeamInformationsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:edit,:update]
  def new
    @team_information = TeamInformation.new
  end

  def create
    @team_information = current_user.team_informations.build(team_information_params)
    if @team_information.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @team_information = TeamInformation.find(params[:id])
  end

  def update
    @team_information = TeamInformation.find(params[:id])
    
    if @team_information.update(team_information_params)
      flash[:success] = 'チーム情報は正常に更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = 'チーム情報は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @team_information.destroy
    flash[:success] = 'チーム情報を削除しました。'
    redirect_back(fallback_location: root_path)
  end
 
 def is_finished
    @team_information = TeamInformation.find(params[:id])
    if @team_information.update(is_finished: true)
      flash[:success] = '受付を終了しました'
      redirect_to root_path
    end
 end
  
  private

  def team_information_params
    params.require(:team_information).permit(:content, :region, :recruiting_people, :name)
  end
  
  def correct_user
    @team_information = current_user.team_informations.find_by(id: params[:id])
    unless @team_information
      redirect_to root_url
    end
  end
end
