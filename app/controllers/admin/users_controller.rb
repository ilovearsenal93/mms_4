class Admin::UsersController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user_signed_in
  before_filter :correct_user

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end
  def index
    @admin = User.all.paginate page: params[:page] 
  end

  def create
    @user = User.new trainee_params
    if @user.save
      flash[:success] = "Create user success"
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end
  def edit
    @user = User.find params[:id]
  end

  def update    
     
    
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end



  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to admin_users_url
  end



  private
  
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def correct_user
      redirect_to(root_path) unless admin_user?(current_user)
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :position)
    end
end
