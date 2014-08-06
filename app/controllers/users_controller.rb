class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show,:index,:edit, :update]
  before_action :client_user_signed_in

  def index
    @users = User.paginate page: params[:page] 
  end

  def show
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to admin_users_url
  end
end
