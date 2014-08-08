class Admin::PositionsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user_signed_in
  before_filter :correct_user

  def show
    @position = Position.find params[:id]
  end

  def new
    @position = Position.new
  end
  def index
    @admin = Position.all.paginate page: params[:page] 
  end
  def create
    @position = Position.new position_params
    if @position.save
      flash[:success] = "Create position success"
      redirect_to admin_position_path(@position)
    else
      render 'new'
    end
  end
  def edit
    @position = Position.find params[:id]
  end
  def update    
    @position = Position.find params[:id]
    if @position.update_attributes position_params
      flash[:success] = "Position updated"
      redirect_to admin_position_path(@position)
    else
      render 'edit'
    end
  end
  def destroy
    Position.find(params[:id]).destroy
    flash[:success] = "position destroyed."
    redirect_to admin_positions_url
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
    def position_params
      params.require(:position).permit(:name, :abbreviation)
    end
end
