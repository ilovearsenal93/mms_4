class Admin::UsersController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user_signed_in
  def show
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to admin_users_url
  end

end
