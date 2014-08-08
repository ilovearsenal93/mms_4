class Admin::SkillsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user_signed_in
  def index
    @skills = Skill.paginate page: params[:page]
    @skill = Skill.new
  end
  def create
    @skill = Skill.new skill_params
    if @skill.save
      flash[:success] = "Skill created!"
    else
      flash[:error] = "Creating skill fail" 
    end
     redirect_to admin_skills_path
  end
  def edit
    @skill = Skill.find_by params[:id]
  end
  def update
    @skill = Skill.find_by params[:id]
    if @skill.update_attributes skill_params
      flash[:success] = "Update successfully!"
      redirect_to admin_skills_path 
    else
      render "edit"
    end
  end
  def destroy
    @skill = Skill.find_by params[:id]
    if @skill.destroy
      flash[:success] = "Delete successfully!"
      redirect_to admin_skills_path 
    end
  end
  private 
  def skill_params
    params.require(:skill).permit(:description)
  end
end
