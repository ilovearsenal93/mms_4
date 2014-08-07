class TeamsController < ApplicationController
  def index
    @teams = Team.paginate page: params[:page] 
  end
  def show
    @team = Team.find params[:id]
    @members = @team.users.paginate page: params[:page]
  end
end
