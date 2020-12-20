class ToppagesController < ApplicationController
  def index
    @team_informations = TeamInformation.order(id: :desc).page(params[:page]).per(5)
  end
end
