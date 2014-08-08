class TeamsController < ApplicationController
  before_action :signed_in_user, only: [:show,:index,:edit, :update]
  before_action :client_user_signed_in

  def index
    @teams = Team.paginate page: params[:page] 
  end
  def show
    @team = Team.find params[:id]
    @members = @team.users.paginate page: params[:page]
  end
end
