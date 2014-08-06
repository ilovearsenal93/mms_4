class Admin::SessionsController < ApplicationController
  def new
  end

  def create  
    admin = User.find_by_email params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password]) && admin_user?(admin)
      sign_in admin
      redirect_back_or admin_user_path(admin)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
